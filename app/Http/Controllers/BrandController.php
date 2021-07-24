<?php

namespace App\Http\Controllers;

use App\CustomClass\OwnLibrary;
use App\Models\Brand;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Cache;
use DB;
use Yajra\DataTables\Facades\DataTables;

class BrandController extends Controller
{
    protected $moduleId = 1;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        OwnLibrary::validateAccess($this->moduleId,1);
        if($request->ajax()) {
            $brands = Brand::whereNotNull('id');
            $brands->orderBy('id', 'DESC');

            return DataTables::of($brands)
                ->addIndexColumn()
                ->addColumn('actions', 'backend.brand.action')
                ->rawColumns(['actions'])
                ->make(true);
        }

        return view('backend.brand.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        OwnLibrary::validateAccess($this->moduleId,2);
        return view('backend.brand.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        OwnLibrary::validateAccess($this->moduleId,2);
        $rules = [
            'name' => 'required|max:500|unique:brands',
            'status' => 'integer|max:2',
        ];

        $message = [
            "name.required" => "Brand name is required",
        ];
        $validation =  Validator::make($request->all(),$rules,$message);

        if ($validation->fails()){
            return redirect()->back()->withInput()->withErrors($validation);
        }else{
            DB::beginTransaction();

            try {
                $brand = new Brand();
                $brand->name         = $request->name;
                $brand->status       = $request->status;

                $brand->save();
            }catch(ValidationException $e) {
                DB::rollback();
                return Redirect::to('/brand')
                    ->withErrors( $e->getErrors() )
                    ->withInput();
            }catch(\Exception $e)
            {
                DB::rollback();
                throw $e;
            }
            DB::commit();

            session()->flash("success", 'Brand '.$brand->name.' created successfully.');
            return redirect()->route("brand.index");
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Unit  $unit
     * @return \Illuminate\Http\Response
     */
    public function show(Brand $brand)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Unit  $unit
     * @return \Illuminate\Http\Response
     */
    public function edit(Brand $brand)
    {
        OwnLibrary::validateAccess($this->moduleId,3);
        return view('backend.brand.edit',compact('brand'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Unit  $unit
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Brand $brand)
    {
        OwnLibrary::validateAccess($this->moduleId,3);
        $rules = [
            'name' => 'required|max:500|unique:brands,name,'.$brand->id,
            'status' => 'integer|max:2',
        ];

        $message = [
            "name.required" => "Name is required",
        ];
        $validation =  Validator::make($request->all(),$rules,$message);

        if ($validation->fails()){
            return redirect()->back()->withInput()->withErrors($validation);
        }else{

            DB::beginTransaction();

            try {
                $brand->name         = $request->name;
                $brand->status       = $request->status;

                $brand->save();
            }catch(ValidationException $e) {
                DB::rollback();
                return Redirect::to('/brand')
                    ->withErrors( $e->getErrors() )
                    ->withInput();
            }catch(\Exception $e)
            {
                DB::rollback();
                throw $e;
            }
            DB::commit();

            session()->flash("success", 'Brand '.$brand->name.' updated successfully.');
            return redirect()->route("brand.index");

        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Warehouse  $role
     * @return \Illuminate\Http\Response
     */
    public function destroy(Brand $brand)
    {
        OwnLibrary::validateAccess($this->moduleId,4);
        if($brand){
            if($brand->status==1)
                $brand->status=0;
            else
                $brand->status=1;

            $brand->save();
            session()->flash('success','Data Inactive successfully');
        }else{
            session()->flash('error','Action Failed!');
        }
        return redirect()->back();
    }

}
