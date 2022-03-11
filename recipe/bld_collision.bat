@echo off

cmake -GNinja ^
  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_BUILD_TYPE:STRING=Release ^
  -DBUILD_SHARED_LIBS=ON ^
  -DUSE_MSVC_RUNTIME_LIBRARY_DLL=ON ^
  -S src\tesseract_collision ^
  -B build_collision_dir
if %errorlevel% neq 0 exit /b %errorlevel%
cmake --build build_collision_dir --config Release -j 4
if %errorlevel% neq 0 exit /b %errorlevel%
cmake --build build_collision_dir --config Release --target install
if %errorlevel% neq 0 exit /b %errorlevel%
