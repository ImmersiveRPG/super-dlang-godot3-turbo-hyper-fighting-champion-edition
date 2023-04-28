

Super Dlang Godot 3 Turbo Hyper Fighting Champion Edition
=======

D language bindings and verification for [Godot 3](https://github.com/GodotNativeTools/godot_headers).

:warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning:
:warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning:
:warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning:

!!! WARNING !!!

These bindings are experimental. Do not expect them to work.

:warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning:
:warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning:
:warning: :warning: :warning: :warning: :warning: :warning: :warning: :warning:


Verification
-------------------------

1. Ensure gdnlib symbol_prefix is set
2. Ensure gdnlib library path is set
3. Ensure project main scene is set
4. Ensure project main scene file exists
5. Ensure scene external resource files exist
6. Ensure scene type and dlang class type are same
7. Ensure scene signal exists in dlang class
8. Ensure scene signal has @Method attribute
9. Ensure gdns has class_name
10. Ensure gdsn has a external resource of type GDNativeLibrary
11. Ensure gdsn external resource GDNativeLibrary file exists
12. Ensure gdsn class exists in dlang code



Generate classes from API files
-------------------------
```sh
git clone https://github.com/workhorsy/godot-d dependencies/godot-d
cd dependencies/godot-d
#generate files in classes from api files
./Godot_v3.5.2-stable_x11.64 --gdnative-generate-json-api api.json
curl -O https://raw.githubusercontent.com/godotengine/godot/3.5/modules/gdnative/gdnative_api.json
dub run :api-binding-generator --skip-registry=all

cd ../..
```

Forked from https://github.com/godot-d/godot-d

License
-------
MIT - <https://opensource.org/licenses/MIT>

Links
-----
GitHub repository - <https://github.com/GodotNativeTools/godot-d>
The C++ bindings these are based on - <https://github.com/GodotNativeTools/godot-cpp>
GDNative repository - <https://github.com/GodotNativeTools/godot_headers>

Godot Engine - <https://godotengine.org>
D programming language - <https://dlang.org>
