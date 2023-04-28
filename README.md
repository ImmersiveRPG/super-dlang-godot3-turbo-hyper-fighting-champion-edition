

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

gdnlib

	1. Ensure symbol_prefix is set
	2. Ensure library path is set

project

	1. Ensure main scene is set
	2. Ensure main scene file exists

scene

	1. Ensure external resource files exist
	2. Ensure node type and dlang class type are same
	3. Ensure signal exists in dlang class
	4. Ensure signal has @Method attribute

gdns

	1. Ensure has class_name
	2. Ensure has a external resource of type GDNativeLibrary
	3. Ensure external resource GDNativeLibrary file exists
	4. Ensure class exists in dlang code



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
