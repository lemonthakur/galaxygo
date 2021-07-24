<?php

namespace App\Http\Controllers;

use App\CustomClass\OwnLibrary;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;
use App\Models\Category;
use Illuminate\Support\Str;

class CategoryController extends Controller
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
        if($request->ajax()){
            $name = $request->name;

            $categories = Category::with('createdBy','updatedBy','parent')->orderBy('name')->orderBy('name','desc');

            return DataTables::of($categories)
                ->addIndexColumn()
                ->addColumn('actions', 'backend.category.action')
                ->rawColumns(['actions'])
                ->make(true);
        }

        return view('backend.category.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        OwnLibrary::validateAccess($this->moduleId,2);
        $categorys = Category::where('status','=',1)->whereNull('parent_id')->get();
        
        return view('backend.category.create', compact('categorys'));
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
            'name' => 'required|max:180|unique:categories'
        ];

        $message = [];

        $validation = Validator::make($request->all(),$rules,$message);
        if ($validation->fails()){
            return redirect()->back()->withInput()->withErrors($validation);
        }else{
            $category = new Category();
            $category->name = $request->name;
            $category->parent_id = $request->parent_id;
            $category->status = $request->status;

            $category->slug = Str::slug($request->name).'-'.rand(1,9999);

            if ($category->save()){
                session()->flash('success','Category Created');
                return redirect()->route('category.index');
            }else{
                session()->flash('error','Category Not Created');
                return redirect()->back()->withInput();
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Category $category)
    {
        OwnLibrary::validateAccess($this->moduleId,3);
        $categorys = Category::where('status','=',1)->whereNull('parent_id')->get();
        return view('backend.category.edit',compact('category', 'categorys'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        OwnLibrary::validateAccess($this->moduleId,3);
        $rules = [
            'name' => 'required|max:180|unique:categories,name,'.$category->id,
        ];

        $message = [];

        $validation = Validator::make($request->all(),$rules,$message);
        if ($validation->fails()){
            return redirect()->back()->withInput()->withErrors($validation);
        }else{

            $category->name = $request->name;
            $category->parent_id = $request->parent_id;
            $category->status = $request->status;

            if ($category->save()){
                session()->flash('success','Category Updated');
                return redirect()->route('category.index');
            }else{
                session()->flash('success','Category Not Updated');
                return redirect()->back()->withInput();
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        OwnLibrary::validateAccess($this->moduleId,4);
        if($category){
            if($category->status==1)
                $category->status=0;
            else
                $category->status=1;

            $category->save();
            session()->flash('success','Data Inactive successfully');
        }else{
            session()->flash('error','Action Failed!');
        }
        return redirect()->back();
    }
}
