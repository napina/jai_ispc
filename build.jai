#import "Basic";
#import "Compiler";
#import "File";
#import "Process";
#import "String";
#if OS == .WINDOWS {
	#import "Windows_Resources";
}

#run {
	set_build_options_dc( .{do_output = false} );

	#if OS == .WINDOWS {
		make_directory_if_it_does_not_exist( "win" );

		print("Compiling kernel.ispc\n");
		run_command( "ispc.exe", "-O2", "ispc/kernel.ispc", "-o", "kernel.obj",
			"--target=sse4,avx,avx2", "--opt=fast-math", "--opt=disable-assertions", "--woff",
			capture_and_return_output = true, print_captured_output = true);

		print("Building static library\n");
		vc_path, linker_path := find_visual_studio_in_a_ridiculous_garbage_way();
		librarian := join( linker_path, "\\lib.exe" );
		run_command( librarian, "/nologo", "kernel.obj", "kernel_sse4.obj", "kernel_avx.obj", "kernel_avx2.obj",
			"/OUT:win/ispc_texcomp.lib", capture_and_return_output = true, print_captured_output = true );
	} else {
		#if OS == .LINUX {
			make_directory_if_it_does_not_exist( "linux" );
			libname := "linux/ispc";
			// TODO
		}
		#if OS == .MACOS {
			make_directory_if_it_does_not_exist( "macos" );
			libname := "macos/ispc";
			// TODO
		}
	}
};
