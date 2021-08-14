@extends('frontend.layout.master')
@section('title','Home')

@section('content')

    <section class="ic-user-home-area">
        <div class="container">
            <div class="ic-user-content-warper">
                <div class="content">
                    <div class="ic-heading text-center">
                        <h2>
                            <span>
                                @if (Auth::check() && Auth::user()->role_id == 0)
                                    {{ucwords(auth()->user()->name)}}
                                @else
                                    i am Guest
                                @endif
                            </span>
                        </h2>
                    </div>
                    <div class="ic-btn-group ic-guest-btn">
                        <div class="ic-today-btn">
                            <a href="{{route('start-contest')}}">
                                <!-- <svg class="icon" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0)">
                                        <path class="path-1" d="M8.58984 37.1521H91.4103V98.5842H8.58984V37.1521Z" fill="#FFC73B" />
                                        <path class="path-2" d="M8.58984 37.1521H91.4103V49.189H8.58984V37.1521Z" fill="#EFB025" />
                                        <path class="path-3" d="M1.54346 21.7207H98.457V42.3995H1.54346V21.7207Z" fill="#FFC73B" />
                                        <path class="path-4" d="M49.9992 28.5789C49.369 29.3114 48.7518 30.0537 48.1491 30.8052C45.9038 33.5991 43.8484 36.5273 41.9906 39.5668C36.0908 49.2089 32.1731 59.9817 30.5205 71.2557C28.0372 67.9613 25.7445 64.3968 23.6831 60.5859C20.0553 62.9525 16.5099 65.6587 13.0957 68.7036C14.8489 56.7445 18.7117 45.25 24.4483 34.7374C27.5123 29.1199 31.1134 23.7823 35.2142 18.8049C35.688 18.2266 36.1694 17.6566 36.6569 17.0883C38.729 18.8728 40.7989 20.6565 42.8711 22.4403C44.9882 24.2637 47.1062 26.0864 49.2233 27.9121C49.4827 28.1319 49.7398 28.3562 49.9992 28.5789Z" fill="white" />
                                        <path class="path-5" d="M86.9046 68.7036C83.4904 65.6587 79.945 62.9525 76.3172 60.5859C74.2558 64.3968 71.9631 67.9613 69.4797 71.2557C67.8272 59.9817 63.9095 49.2089 58.0096 39.5668C56.1519 36.5273 54.0942 33.5991 51.8512 30.8052C51.2462 30.0537 50.6289 29.3114 49.9995 28.5789C50.2581 28.3562 50.516 28.1341 50.7747 27.9121C52.8941 26.0864 55.012 24.2614 57.1292 22.4403C59.2014 20.6543 61.2735 18.8728 63.3434 17.0883C63.8309 17.6544 64.3123 18.2266 64.7861 18.8026C68.8869 23.78 72.488 29.1176 75.5543 34.7374C81.2886 45.25 85.1513 56.7445 86.9046 68.7036Z" fill="white" />
                                        <path class="path-6" d="M75.5543 34.7373L58.0096 39.5667C56.1519 36.5272 54.0942 33.599 51.8512 30.8051L50.7747 27.912L49.9995 25.8254L57.1292 22.4402L64.7861 18.8025C68.8869 23.7799 72.488 29.1175 75.5543 34.7373Z" fill="#DFDFDF" />
                                        <path class="path-7" d="M49.9992 25.8254L49.2233 27.9121L48.1491 30.8051C45.9037 33.599 43.8483 36.5272 41.9906 39.5668L24.4482 34.7373C27.5122 29.1198 31.1133 23.7822 35.2141 18.8048L42.871 22.4402L49.9992 25.8254Z" fill="#DFDFDF" />
                                        <path class="path-8" d="M77.9992 2.40454L50 15.7019L55.378 30.1665L85.2624 21.9404C89.1717 20.8647 91.3187 16.67 89.9057 12.8706L87.4391 6.23833C86.0261 2.43811 81.6606 0.665796 77.9992 2.40454Z" fill="white" />
                                        <path class="path-9" d="M22.0017 2.40454L50.0002 15.7019L44.6222 30.1665L14.7377 21.9404C10.8292 20.8647 8.68149 16.67 10.0945 12.8706L12.5611 6.23833C13.974 2.43811 18.3396 0.665796 22.0017 2.40454Z" fill="white" />
                                        <path class="path-10" d="M54.3901 10.7306H45.6101C43.2069 10.7306 41.2583 12.6784 41.2583 15.0817V27.8388C41.2583 30.2421 43.2069 32.1906 45.6101 32.1906H54.3901C56.7941 32.1906 58.7419 30.2421 58.7419 27.8388V15.0817C58.7419 12.6784 56.7933 10.7306 54.3901 10.7306Z" fill="white" />
                                        <path class="path-11" d="M42.2842 42.3994H57.7154V98.584H42.2842V42.3994Z" fill="white" />
                                        <path class="path-12" d="M42.2847 42.3997H57.7159V49.1891H42.2847V42.3997Z" fill="#DFDFDF" />
                                        <path class="path-13" d="M98.457 20.1773H90.3149C90.5514 19.8455 90.7658 19.4968 90.9534 19.1313C92.0307 17.0271 92.1764 14.5491 91.3532 12.332L88.8859 5.7005C88.0634 3.48568 86.3354 1.70497 84.1465 0.815377C81.9553 -0.074977 79.4734 -0.00402339 77.3364 1.01069L57.8097 10.2843C56.8446 9.59456 55.6643 9.18715 54.3902 9.18715H45.6102C44.3361 9.18715 43.1551 9.59532 42.19 10.285L22.664 1.00993C20.527 -0.00402328 18.0451 -0.074977 15.8539 0.815377C13.6651 1.70497 11.937 3.48568 11.1145 5.69974L8.64719 12.3328C7.82398 14.5491 7.9697 17.0271 9.04774 19.1313C9.23466 19.4968 9.44981 19.8462 9.68632 20.1773H1.54343C0.691226 20.1773 0 20.8678 0 21.7208V32.8315C0 33.6837 0.691226 34.3749 1.54343 34.3749C2.39564 34.3749 3.08687 33.6837 3.08687 32.8315V23.2634H13.807C13.9786 23.3237 14.1526 23.3794 14.3288 23.4282L27.2859 26.995C24.4065 31.4071 21.8667 36.0481 19.6923 40.8569H3.08687V39.0045C3.08687 38.1523 2.39564 37.4618 1.54343 37.4618C0.691226 37.4618 0 38.1523 0 39.0045V42.4003C0 43.2525 0.691226 43.9438 1.54343 43.9438H7.0473V98.5834C7.0473 99.4364 7.73853 100.127 8.59073 100.127H91.4097C92.2619 100.127 92.9531 99.4364 92.9531 98.5834V89.6219C92.9531 88.7697 92.2619 88.0785 91.4097 88.0785C90.5567 88.0785 89.8662 88.7697 89.8662 89.6219V97.0408H59.2593V44.8929C63.6309 53.1731 66.5904 62.1766 67.9522 71.4791C68.0423 72.0948 68.4939 72.5961 69.0974 72.7502C69.2241 72.783 69.3522 72.7983 69.4797 72.7983C69.9565 72.7983 70.4158 72.577 70.7118 72.1841C72.9304 69.2407 74.9934 66.0897 76.8558 62.7999C79.9747 64.9239 83.0028 67.2921 85.8761 69.8556C86.3605 70.2874 87.064 70.3706 87.6354 70.0624C88.2068 69.7549 88.525 69.1224 88.4304 68.48C87.1982 60.0747 84.901 51.8089 81.6448 43.9438H89.8655V83.4482C89.8655 84.3012 90.5567 84.9916 91.4089 84.9916C92.2619 84.9916 92.9523 84.3012 92.9523 83.4482V43.9438H98.457C99.3092 43.9438 99.9996 43.2525 99.9996 42.4003V21.7208C100 20.8678 99.31 20.1773 98.457 20.1773ZM78.6601 3.79848C80.0373 3.1454 81.5723 3.10115 82.9845 3.67489C84.3944 4.24786 85.4625 5.34878 85.9928 6.77625L88.4594 13.407C88.9904 14.8352 88.8996 16.3687 88.2053 17.7245C87.5118 19.0795 86.3209 20.0484 84.853 20.452L60.2854 27.2155V19.7982C65.8076 16.4168 79.5742 9.44273 83.0005 14.279C83.4926 14.9741 84.4555 15.1396 85.1513 14.6468C85.8471 14.1539 86.0119 13.1903 85.519 12.4953C82.8746 8.76219 77.3021 8.58061 68.9548 11.9566C65.5162 13.3467 62.3416 15.0435 60.2854 16.2207V15.0816C60.2854 14.2554 60.1138 13.468 59.8055 12.7531L78.6601 3.79848ZM45.6102 12.2733H54.3902C55.9389 12.2733 57.1986 13.5336 57.1986 15.0816V27.8388C57.1986 29.3876 55.9389 30.6472 54.3902 30.6472H45.6102C44.0615 30.6472 42.8018 29.3876 42.8018 27.8388V15.0816C42.8018 13.5329 44.0615 12.2733 45.6102 12.2733ZM43.0162 40.8561C44.4925 38.4033 46.0993 36.0259 47.8281 33.7341H52.1708C53.9004 36.0259 55.5071 38.4033 56.9827 40.8561H43.0162ZM11.7951 17.7245C11.1008 16.3687 11.01 14.8352 11.5403 13.4077L14.0084 6.77549C14.5379 5.34878 15.606 4.24786 17.0159 3.67489C18.4274 3.10115 19.9632 3.1454 21.3395 3.79848L40.1949 12.7547C39.8866 13.4688 39.715 14.2554 39.715 15.0824V16.3092C37.6657 15.1297 34.4194 13.3826 30.8931 11.9566C22.5465 8.58061 16.9732 8.76219 14.3288 12.4953C13.836 13.1903 14.0008 14.1539 14.6966 14.6468C15.3924 15.1396 16.3552 14.9748 16.8473 14.279C20.3057 9.39696 34.2988 16.5488 39.715 19.892V27.2155L15.1482 20.4528C13.6796 20.0484 12.4886 19.0795 11.7951 17.7245ZM40.4077 30.6075C41.176 32.0449 42.5218 33.1291 44.1339 33.5464C36.9157 43.6172 31.9467 55.1888 29.6159 67.3516C27.9763 64.956 26.4436 62.4451 25.0405 59.8519C24.8353 59.4719 24.4813 59.1958 24.0624 59.0897C23.6444 58.9837 23.2011 59.0577 22.8402 59.2934C20.2699 60.9696 17.7529 62.8083 15.3222 64.7828C17.8254 51.6434 22.9974 38.974 30.4139 27.8564L40.4077 30.6075ZM10.1342 43.9438H18.3556C15.0994 51.8089 12.8022 60.0739 11.5693 68.48C11.4754 69.1224 11.7928 69.7549 12.3642 70.0624C12.9365 70.3698 13.6391 70.2874 14.1236 69.8556C16.9968 67.2921 20.025 64.9239 23.1446 62.7999C25.007 66.0897 27.0692 69.2399 29.2886 72.1841C29.5846 72.577 30.0439 72.799 30.5208 72.799C30.6482 72.799 30.7763 72.783 30.903 72.7502C31.5065 72.5961 31.9574 72.0948 32.0474 71.4791C33.41 62.1766 36.3695 53.1723 40.7404 44.8921V97.0408H10.1342V43.9438ZM43.8272 97.0408V43.9438H56.1732V97.0408H43.8272ZM77.1602 59.2934C76.7993 59.0577 76.3553 58.9844 75.938 59.0905C75.5199 59.1965 75.1651 59.4727 74.9599 59.8519C73.5568 62.4451 72.0241 64.9567 70.3845 67.3516C68.0537 55.188 63.0847 43.6172 55.8657 33.5471C57.4778 33.1306 58.8244 32.0457 59.5927 30.6075L69.5888 27.8556C77.0038 38.9755 82.1758 51.6449 84.679 64.7828C82.2475 62.8083 79.7306 60.9696 77.1602 59.2934ZM96.9135 40.8569H80.3089C78.1345 36.0481 75.5946 31.4071 72.7161 26.995L85.6716 23.4282C85.8478 23.3794 86.0218 23.3237 86.1934 23.2634H96.9135V40.8569Z" fill="black" />
                                    </g>
                                    <defs>
                                        <clipPath id="clip0">
                                            <rect width="100" height="100" fill="white" />
                                        </clipPath>
                                    </defs>
                                </svg> -->
                                <span>play</span>
                                <!-- <svg class="shape" viewBox="0 0 216 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M226.62 35.0891C232.768 51.8196 244.822 65.7788 243.28 84.6248C241.584 105.337 236.627 129.302 217.639 144.807C198.926 160.087 173.068 155.874 149.887 160.888C128.761 165.457 107.529 176.409 88.0102 172.843C67.1615 169.034 52.0975 156.031 40.9201 140.979C28.7963 124.653 15.6722 105.892 22.1799 84.1962C28.6086 62.7645 51.7852 45.7846 73.4521 32.5241C91.292 21.6058 112.355 25.51 131.506 17.2867C157.392 6.17149 178.783 -28.0046 203.599 -23.3598C227.399 -18.9051 219.206 14.9143 226.62 35.0891Z" fill="#E2CF61" />
                                </svg> -->

                            </a>
                        </div>
                        <div class="ic-tomorrow-btn">
                            <a href="{{route('start-contest')}}">
                                <!-- <svg class="icon" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0)">
                                        <path class="path-1" d="M86.2069 50.1724V39.6552H3.44824V96.5517C3.45392 98.4538 4.99445 99.9943 6.89652 100H65.5172L86.2069 50.1724Z" fill="#C4C4C4" />
                                        <path class="path-2" d="M10.3447 94.8276C9.39253 94.8276 8.62061 94.0557 8.62061 93.1035V89.6552C8.62061 88.703 9.39253 87.931 10.3447 87.931C11.297 87.931 12.0689 88.703 12.0689 89.6552V93.1035C12.0689 94.0557 11.297 94.8276 10.3447 94.8276Z" fill="#6A6A6A" />
                                        <path class="path-3" d="M10.3447 84.4828C9.39253 84.4828 8.62061 83.7108 8.62061 82.7586V51.7241C8.62061 50.7719 9.39253 50 10.3447 50C11.297 50 12.0689 50.7719 12.0689 51.7241V82.7586C12.0689 83.7108 11.297 84.4828 10.3447 84.4828Z" fill="#6A6A6A" />
                                        <path class="path-4" d="M3.44824 41.3793H86.2069V46.5517H3.44824V41.3793Z" fill="#6A6A6A" />
                                        <path class="path-5" d="M72.1552 13.2414C74.7934 12.134 77.2156 10.5698 79.3103 8.62073L81.0345 15.5173L87.931 13.7931C86.2069 24.138 77.5862 27.5862 70.6896 27.5862L44.8276 31.8966L18.9655 27.5862C12.0689 27.5862 3.44826 24.138 1.72412 13.7931L8.62067 15.5173L10.3448 8.62073C12.444 10.5724 14.8723 12.1368 17.5172 13.2414L44.8276 18.4138L72.1552 13.2414Z" fill="#F29C1F" />
                                        <path class="path-6" d="M44.8275 17.2414C44.8275 17.2414 41.5516 2.38102 26.9965 0.0396406C26.1789 -0.0830649 25.3449 0.101186 24.6551 0.556882C22.3533 2.05171 17.5327 6.35171 17.2533 16.2965C17.2346 16.9486 17.4047 17.5922 17.743 18.15C19.2085 20.5448 24.2775 26.7396 37.9154 27.7517L44.8275 17.2414Z" fill="#F0C419" />
                                        <path class="path-7" d="M44.8398 17.2413C44.8398 17.2413 48.1157 2.381 62.6709 0.0396245C63.4879 -0.0833068 64.3215 0.100979 65.0105 0.556866C67.314 2.05169 72.1347 6.35169 72.4123 16.2965C72.4316 16.9484 72.2622 17.5921 71.9243 18.15C70.4571 20.5482 65.3726 26.7586 51.6881 27.7551L44.8398 17.2413Z" fill="#F0C419" />
                                        <path class="path-8" d="M3.44828 27.5862H86.2069C88.1113 27.5862 89.6552 29.13 89.6552 31.0345V39.6551C89.6552 40.6074 88.8833 41.3793 87.931 41.3793H1.72414C0.771923 41.3793 0 40.6074 0 39.6551V31.0345C0 29.13 1.54385 27.5862 3.44828 27.5862Z" fill="#C4C4C4" />
                                        <path class="path-9" d="M36.207 27.5862H53.4484V41.3793H36.207V27.5862Z" fill="#F0C419" />
                                        <path class="path-10" d="M37.9312 41.3793H51.7243V100H37.9312V41.3793Z" fill="#F29C1F" />
                                        <path class="path-11" d="M62.0688 72.4137H96.5516V96.5516C96.5516 98.456 95.0078 99.9999 93.1033 99.9999H65.5171C63.6127 99.9999 62.0688 98.456 62.0688 96.5516V72.4137Z" fill="#2980BA" />
                                        <path class="path-12" d="M79.31 58.6207C79.31 58.6207 77.7893 50.7776 67.6151 48.3672C66.2514 48.0524 64.8322 48.5883 64.0169 49.7259C62.0726 52.3254 60.8176 55.3746 60.3686 58.5897C60.2346 59.6784 60.6173 60.7673 61.4031 61.5328C64.8755 64.6295 69.5251 66.0591 74.1376 65.4483L79.31 58.6207Z" fill="#F0C419" />
                                        <path class="path-13" d="M79.3105 58.6207C79.3105 58.6207 80.8312 50.7776 91.0054 48.3672C92.3691 48.0524 93.7884 48.5883 94.6037 49.7259C96.5479 52.3254 97.8029 55.3746 98.2519 58.5897C98.3859 59.6784 98.0032 60.7673 97.2175 61.5328C93.745 64.6295 89.0954 66.0591 84.483 65.4483L79.3105 58.6207Z" fill="#F0C419" />
                                        <path class="path-14" d="M74.1377 75.8621H84.4825V100H74.1377V75.8621Z" fill="#F29C1F" />
                                        <path class="path-15" d="M39.1568 19.793C38.5408 19.793 37.9717 19.4644 37.6637 18.9309C36.8947 17.6051 34.1051 13.1861 30.4878 11.9758C29.9026 11.7805 29.4661 11.2879 29.3426 10.6835C29.2191 10.0791 29.4275 9.45468 29.8892 9.04553C30.3508 8.63639 30.9957 8.50463 31.5809 8.6999C36.2137 10.2516 39.4637 15.1551 40.6464 17.193C40.9541 17.7259 40.9545 18.3824 40.6473 18.9156C40.3402 19.4488 39.7721 19.778 39.1568 19.7792V19.793Z" fill="#F29C1F" />
                                        <path class="path-16" d="M50.4985 19.793C49.8831 19.7918 49.3151 19.4627 49.008 18.9295C48.7008 18.3962 48.7011 17.7397 49.0088 17.2068C50.1916 15.1723 53.4485 10.2603 58.0743 8.71027C58.6595 8.51501 59.3044 8.64676 59.7661 9.05591C60.2278 9.46506 60.4361 10.0894 60.3127 10.6938C60.1892 11.2983 59.7526 11.7909 59.1674 11.9861C55.5468 13.193 52.7606 17.6154 51.9916 18.9413C51.681 19.4708 51.1123 19.7952 50.4985 19.793Z" fill="#F29C1F" />
                                        <path class="path-17" d="M41.3794 17.2413H48.276C50.1804 17.2413 51.7243 18.7852 51.7243 20.6896V27.5862H37.9312V20.6896C37.9312 18.7852 39.475 17.2413 41.3794 17.2413Z" fill="#F3D55B" />
                                        <path class="path-18" d="M77.586 58.6207H81.0343C82.9387 58.6207 84.4825 60.1646 84.4825 62.069V65.5173H74.1377V62.069C74.1377 60.1646 75.6815 58.6207 77.586 58.6207Z" fill="#F3D55B" />
                                        <path class="path-19" d="M62.0694 65.5172H96.5521C98.4566 65.5172 100 67.0611 100 68.9655V74.1379C100 75.0901 99.2285 75.862 98.2763 75.862H60.3452C59.393 75.862 58.6211 75.0901 58.6211 74.1379V68.9655C58.6211 67.0611 60.1649 65.5172 62.0694 65.5172Z" fill="#3B97D3" />
                                        <path class="path-20" d="M72.4136 65.5172H86.2067V75.862H72.4136V65.5172Z" fill="#F0C419" />
                                    </g>
                                    <defs>
                                        <clipPath id="clip0">
                                            <rect width="100" height="100" fill="white" />
                                        </clipPath>
                                    </defs>
                                </svg> -->

                                <span>comming soon</span>
                                <!-- <svg class="shape" viewBox="0 0 216 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M226.62 35.0891C232.768 51.8196 244.822 65.7788 243.28 84.6248C241.584 105.337 236.627 129.302 217.639 144.807C198.926 160.087 173.068 155.874 149.887 160.888C128.761 165.457 107.529 176.409 88.0102 172.843C67.1615 169.034 52.0975 156.031 40.9201 140.979C28.7963 124.653 15.6722 105.892 22.1799 84.1962C28.6086 62.7645 51.7852 45.7846 73.4521 32.5241C91.292 21.6058 112.355 25.51 131.506 17.2867C157.392 6.17149 178.783 -28.0046 203.599 -23.3598C227.399 -18.9051 219.206 14.9143 226.62 35.0891Z" fill="#E2CF61" />
                                </svg> -->

                            </a>
                        </div>

                        <div class="ic-shopping-btn">
                            <a href="{{route('shop')}}">
                                <svg class="icon" viewBox="0 0 100 100" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M57.8125 92.1875H4.6875L7.8125 29.6875H54.6875L57.8125 92.1875Z" fill="#D6BA4F" />
                                    <path d="M70.3125 92.1875H57.8125L54.6875 29.6875H67.1875L70.3125 92.1875Z" fill="#D6BA4F" />
                                    <path d="M95.3125 92.1875H82.8125L82.6172 89.6621V89.6602L79.6875 51.5625H92.1875L95.0684 89.002V89.0039L95.3125 92.1875Z" fill="#EBA72E" />
                                    <path d="M25 57.8125H15.625V45.3125L20.3125 42.1875L25 45.3125V57.8125Z" fill="#F7B030" />
                                    <path d="M82.8125 92.1875H42.1875L45.3125 51.5625H79.6875L82.8125 92.1875Z" fill="#F7B030" />
                                    <path d="M93.7455 51.4426C93.7153 51.0501 93.538 50.6835 93.2492 50.416C92.9603 50.1486 92.5812 50 92.1875 50H69.7676L68.748 29.6094C68.728 29.209 68.5548 28.8317 68.2644 28.5554C67.9739 28.2791 67.5884 28.125 67.1875 28.125H56.25V20.3125C56.2508 18.0626 55.7115 15.8453 54.6775 13.8471C53.6435 11.8488 52.1449 10.1279 50.3077 8.82905C48.4706 7.53017 46.3485 6.69124 44.1198 6.38276C41.8911 6.07428 39.6209 6.30525 37.5 7.05627C35.3791 6.30525 33.1089 6.07428 30.8802 6.38276C28.6515 6.69124 26.5294 7.53017 24.6923 8.82905C22.8551 10.1279 21.3565 11.8488 20.3225 13.8471C19.2885 15.8453 18.7492 18.0626 18.75 20.3125V28.125H7.8125C7.41162 28.125 7.02608 28.2791 6.73562 28.5554C6.44516 28.8317 6.272 29.209 6.25195 29.6094L3.12695 92.1094C3.11637 92.3209 3.14888 92.5324 3.22253 92.7309C3.29617 92.9295 3.40941 93.111 3.55536 93.2644C3.70131 93.4178 3.87693 93.54 4.07155 93.6235C4.26617 93.707 4.47573 93.75 4.6875 93.75H95.3125C95.5278 93.75 95.7408 93.7056 95.9381 93.6194C96.1354 93.5332 96.3128 93.4072 96.459 93.2492C96.6053 93.0912 96.7174 92.9047 96.7882 92.7014C96.859 92.498 96.887 92.2823 96.8705 92.0676L93.7455 51.4426ZM89.0625 85.6293L92.393 90.625H85.7328L89.0625 85.6293ZM93.2961 86.3459L90.5785 82.2698L87.6641 53.125H90.7406L93.2961 86.3459ZM84.5234 53.125L87.4531 82.4114L84.0234 87.5547L81.3748 53.125H84.5234ZM66.6387 50H63.6978L62.5947 31.25H65.7002L66.6387 50ZM59.4643 31.25L60.5674 50H57.2666L56.3291 31.25H59.4643ZM42.1875 9.37503C45.0873 9.37833 47.8674 10.5317 49.9178 12.5822C51.9683 14.6327 53.1217 17.4127 53.125 20.3125V28.125H46.875V20.3125C46.875 18.2176 46.4062 16.1492 45.5029 14.2589C44.5997 12.3687 43.2849 10.7046 41.6549 9.3885C41.8314 9.3801 42.0088 9.37503 42.1875 9.37503ZM37.5 10.4324C39.3687 11.3206 40.9476 12.7201 42.0537 14.4687C43.1599 16.2173 43.748 18.2434 43.75 20.3125V28.125H31.25V20.3125C31.252 18.2434 31.8401 16.2173 32.9463 14.4687C34.0524 12.7201 35.6313 11.3206 37.5 10.4324ZM21.875 20.3125C21.8783 17.4127 23.0317 14.6327 25.0822 12.5822C27.1326 10.5317 29.9127 9.37833 32.8125 9.37503C32.9912 9.37503 33.1686 9.3801 33.3451 9.3885C31.7151 10.7045 30.4003 12.3687 29.497 14.2589C28.5937 16.1491 28.125 18.2176 28.125 20.3125V28.125H21.875V20.3125ZM40.7406 90.625H6.33008L9.29883 31.25H18.75V41.3514L14.7582 44.0125C14.5442 44.1552 14.3687 44.3485 14.2474 44.5753C14.126 44.8021 14.0625 45.0553 14.0625 45.3125V57.8125C14.0625 58.2269 14.2271 58.6244 14.5201 58.9174C14.8132 59.2104 15.2106 59.375 15.625 59.375H25C25.4144 59.375 25.8118 59.2104 26.1049 58.9174C26.3979 58.6244 26.5625 58.2269 26.5625 57.8125V45.3125C26.5625 45.0553 26.499 44.8021 26.3776 44.5753C26.2563 44.3485 26.0808 44.1552 25.8668 44.0125L21.875 41.3514V31.25H43.75V35.9375C43.75 36.3519 43.9146 36.7494 44.2076 37.0424C44.5007 37.3354 44.8981 37.5 45.3125 37.5C45.7269 37.5 46.1243 37.3354 46.4174 37.0424C46.7104 36.7494 46.875 36.3519 46.875 35.9375V31.25H53.2012L54.1387 50H45.3125C44.9188 50 44.5397 50.1486 44.2508 50.416C43.962 50.6835 43.7847 51.0501 43.7545 51.4426L40.7406 90.625ZM20.3125 44.0655L23.4375 46.1487V56.25H17.1875V46.1487L20.3125 44.0655ZM46.7594 53.125H78.2406L81.1252 90.625H43.8748L46.7594 53.125Z" fill="white" />
                                    <path d="M70.3125 59.375C69.8981 59.375 69.5007 59.5396 69.2076 59.8326C68.9146 60.1257 68.75 60.5231 68.75 60.9375V73.4375C68.7486 74.6803 68.2543 75.8717 67.3755 76.7505C66.4967 77.6293 65.3053 78.1236 64.0625 78.125H60.9375C59.6947 78.1236 58.5033 77.6293 57.6245 76.7505C56.7457 75.8717 56.2514 74.6803 56.25 73.4375V60.9375C56.25 60.5231 56.0854 60.1257 55.7924 59.8326C55.4993 59.5396 55.1019 59.375 54.6875 59.375C54.2731 59.375 53.8757 59.5396 53.5826 59.8326C53.2896 60.1257 53.125 60.5231 53.125 60.9375V73.4375C53.1273 75.5088 53.9512 77.4946 55.4158 78.9592C56.8804 80.4238 58.8662 81.2477 60.9375 81.25H64.0625C66.1338 81.2477 68.1196 80.4238 69.5842 78.9592C71.0488 77.4946 71.8727 75.5088 71.875 73.4375V60.9375C71.875 60.5231 71.7104 60.1257 71.4174 59.8326C71.1243 59.5396 70.7269 59.375 70.3125 59.375Z" fill="white" />

                                </svg>


                                <span>Shopping</span>
                                <!-- <svg class="shape" viewBox="0 0 216 80" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M226.62 35.0891C232.768 51.8196 244.822 65.7788 243.28 84.6248C241.584 105.337 236.627 129.302 217.639 144.807C198.926 160.087 173.068 155.874 149.887 160.888C128.761 165.457 107.529 176.409 88.0102 172.843C67.1615 169.034 52.0975 156.031 40.9201 140.979C28.7963 124.653 15.6722 105.892 22.1799 84.1962C28.6086 62.7645 51.7852 45.7846 73.4521 32.5241C91.292 21.6058 112.355 25.51 131.506 17.2867C157.392 6.17149 178.783 -28.0046 203.599 -23.3598C227.399 -18.9051 219.206 14.9143 226.62 35.0891Z" fill="#E2CF61" />
                                </svg> -->

                            </a>
                        </div>
                        <div class="ic-get-share-btn">
                            <a href="#" class="ic-chat-icon">
                            <span class="chat-svg-warper">
                                <svg id="Layer_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512" width="512" xmlns="http://www.w3.org/2000/svg">
                                    <g>
                                        <g>
                                            <path d="m512 219.649c0-121.309-98.789-219.649-220.651-219.649-121.863 0-220.652 98.34-220.652 219.649s98.789 219.65 220.652 219.65c25.577 0 50.13-4.347 72.974-12.314l67.316 32.51v-70.301c49.076-40.287 80.361-101.279 80.361-169.545z" fill="#ff9e5e" />
                                            <path d="m291.349 0c-6.949 0-13.819.336-20.604.961 112.2 10.345 200.048 104.297 200.048 218.688 0 112.497-90.212 208.074-200.36 218.661 6.886.645 13.861.988 20.916.988 25.577 0 50.13-4.347 72.974-12.314l67.316 32.51v-70.301c49.076-40.286 80.361-101.278 80.361-169.544 0-121.309-98.789-219.649-220.651-219.649z" fill="#fa8d46" />
                                            <g fill="#fff7e8">
                                                <circle cx="189.238" cy="224.035" r="31.119" />
                                                <circle cx="291.348" cy="224.035" r="31.119" />
                                                <circle cx="393.459" cy="224.035" r="31.119" />
                                            </g>
                                        </g>
                                        <path d="m0 393.758c0-59.804 48.702-108.285 108.779-108.285s108.78 48.481 108.78 108.285c0 59.805-48.702 108.286-108.78 108.286-12.609 0-24.714-2.143-35.976-6.071l-33.185 16.027v-34.658c-24.194-19.861-39.618-49.929-39.618-83.584z" fill="#ffd88f" />
                                        <g>
                                            <path d="m108.779 285.472c-7.045 0-13.931.675-20.603 1.948 50.224 9.587 88.176 53.546 88.176 106.338 0 52.773-37.925 96.72-88.123 106.327 6.657 1.27 13.521 1.959 20.55 1.959 60.077 0 108.78-48.481 108.78-108.286s-48.702-108.286-108.78-108.286z" fill="#ffc963" />
                                        </g>
                                    </g>
                                </svg>
                            </span>

                                <span class="public-chat-txt">public <br> chat</span>
                            </a>
                            <a href="javascript:void(0)" class="ic-faceboob-share-btn" id="fbShareTg">
                            <span class="facebook-svg-warper">
                                <svg width="36" height="36" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M18 36C27.9411 36 36 27.9411 36 18C36 8.05888 27.9411 0 18 0C8.05888 0 0 8.05888 0 18C0 27.9411 8.05888 36 18 36Z" fill="#3B5998" />
                                    <path d="M22.5254 18.7046H19.3135V30.4715H14.4472V18.7046H12.1328V14.5693H14.4472V11.8933C14.4472 9.97961 15.3562 6.98303 19.3568 6.98303L22.9614 6.99811V11.0122H20.346C19.917 11.0122 19.3138 11.2265 19.3138 12.1394V14.5731H22.9505L22.5254 18.7046Z" fill="white" />
                                </svg>
                            </span>
                                <span class="facebook-bonus-txt">Share, Get <br> Instant Bonus!</span>
                            </a>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

@endsection

@section('js')

    <script>
        $(document).ready(function () {
            let formData = {};

            function loadDataTable(formData) {
                $('#dTable').dataTable({
                    dom: 'Blrtip',
                    // dom: 'Blfrtip',
                    buttons: [
                        {
                            extend: 'print',
                            title: 'Order List - {{date("d-m-Y")}}',
                            exportOptions: {
                                stripHtml: false,
                                columns: [0, 1, 2, 3, 4, 5, 6, 7],
                            }
                        },
                        {
                            extend: 'excelHtml5',
                            title: 'Product List - {{date("d-m-Y")}}',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4, 5, 6, 7]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            title: 'Product List - {{date("d-m-Y")}}',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4, 5, 6, 7]
                            }
                        }
                    ],
                    "responsive": true,
                    'processing': true,
                    'serverSide': true,
                    "pageLength": 10,
                    "lengthMenu": [[5, 10, 20, 30, 40, 50, 100, -1], [5, 10, 20, 30, 40, 50, 100, "All"]],

                    "bSort": false,
                    "language": {

                        // Change the Pagination button labels
                        "paginate": {
                            "first": "First",
                            "last": "Last",
                            "previous": "Previous",
                            "next": "Next",
                        }
                    },
                    'ajax': {
                        'url': '{{route("backend.order.view")}}',
                        "type": "GET",
                        "data": formData
                    },
                    'columns': [
                        {data: 'DT_RowIndex'},
                        {data: 'tran_id'},
                        {data: 'total_quantity'},
                        {data: 'subtotal'},
                        {data: 'delivery_charge'},
                        {data: 'total'},
                        {data: 'payment_type'},
                        {data: 'dropdown'},
                        {data: 'actions'},
                    ]
                });
            }

            loadDataTable();

            $('#filterForm').on('submit', function (event) {
                event.preventDefault();
                formData = getFormData($(this));

                $('#dTable').DataTable().destroy();
                $('#dTable tbody').empty();
                loadDataTable(formData);
            });

            function getFormData($form) {
                let unindexed_array = $form.serializeArray();
                let indexed_array = {};

                $.map(unindexed_array, function (n, i) {
                    indexed_array[n['name']] = n['value'];
                });

                return indexed_array;
            }

            $(document).on('input', '#name', function () {
                $('#filterForm').submit();
            });

            $('#reset').on('click',function () {
                formData = {};
                $('#dTable').DataTable().destroy();
                $('#dTable tbody').empty();
                loadDataTable(formData);
            });

            $('.onlydate').datepicker({
                //format: 'yyyy/mm/dd',
                format: 'dd-mm-yyyy',
                autoclose:true,
                clearBtn:true,
                todayHighlight:true,
            });

            //$('.order_status').on('change', function (e) {
            $(document).on('change', '.order_status', function (e) {
                var me = $(this);

                var value       = $(this).val();
                var order_value = $(this).val();
                var order_id    = $(this).attr('data-id');

                e.preventDefault();
                swal.fire({
                    title: 'Please Confirm',
                    text: "Order Is "+value+" ??",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText: ' No!',
                    confirmButtonText: 'Yes!'
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: "{{ route('backend.orders-status-change')}}",
                            type: "post",
                            data: {"order_value": order_value,"order_id":order_id, _token: '{{csrf_token()}}'},
                            success:function(data) {
                                var message_txt = null;
                                var msg_type = null;
                                if(data=='success'){
                                    var message_txt = "Order Is "+value;
                                    msg_type = 'success';
                                }
                                else if(data=="faild"){
                                    var message_txt = "Something went wrong. Please try again later.";
                                    msg_type = 'error';
                                }

                                swal.fire({
                                    text: message_txt,
                                    type: msg_type
                                });
                            }
                        });

                    }else{
                        /*$('#order_status').val(order_status_default_select).select2();*/
                    }
                });


            });

        });
    </script>

    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
    <div id="shareBtn" class="btn btn-success clearfix">Share Dialog</div>
    <script>
        window.fbAsyncInit = function() {
            FB.init({
                appId            : '542974070289636',
                autoLogAppEvents : true,
                xfbml            : true,
                version          : 'v11.0'
            });
        };

        document.getElementById('fbShareTg').onclick = function() {
            var fb_share_link = "{{ $fb_share_link->facebook_share_link }}";
            FB.ui({
                display: 'popup',
                method: 'share',
                href: fb_share_link,
            }, function(response){
                if(response){
                    var csrf = "{{csrf_token()}}";
                    $.ajax(
                        {
                            url: "{{ route('facebook-share.coin') }}",
                            type: "post",
                            data: {_token: csrf}
                        })
                        .done(function(data)
                        {
                            if(data.ret == 'today_share'){
                                toastr.options =
                                    {
                                        "closeButton" : true,
                                        "progressBar" : true
                                    }
                                toastr.error("Thanks for you share. You have already received point for today.");
                            }
                            else if(data.ret == 'db_error'){
                                toastr.options =
                                    {
                                        "closeButton" : true,
                                        "progressBar" : true
                                    }
                                toastr.error("Something went wrong. Please try again later.");
                            }
                            else if(data.ret == 'success'){
                                $(".aft-bd-share").empty().text(parseFloat(data.val).toFixed(2));
                                toastr.options =
                                    {
                                        "closeButton" : true,
                                        "progressBar" : true
                                    }
                                toastr.success("Thanks for your share. you have received 100 coins.");
                            }
                        });
                }
                else{
                    toastr.options =
                        {
                            "closeButton" : true,
                            "progressBar" : true
                        }
                    toastr.error("Facebook share canceled.");
                }

            });
        }
    </script>
@endsection
