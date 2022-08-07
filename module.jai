
rgba_surface :: struct
{
    ptr: *u8;
    width: s32;
    height: s32;
    strideInBytes: s32;
}

bc7_enc_settings :: struct
{
    mode_selection: [4]bool;
    refineIterations: [8]s32;

    skip_mode2: bool;
    fastSkipTreshold_mode1: s32;
    fastSkipTreshold_mode3: s32;
    fastSkipTreshold_mode7: s32;

    mode45_channel0: s32;
    refineIterations_channel: s32;

    channels: s32;
}

bc6h_enc_settings :: struct
{
    slow_mode: bool;
    fast_mode: bool;
    refineIterations_1p: s32;
    refineIterations_2p: s32;
    fastSkipTreshold: s32;
}

GetProfile_ultrafast :: ( settings: *bc7_enc_settings )
{
    settings.channels = 3;

    // mode02
    settings.mode_selection[0] = false;
    settings.skip_mode2 = true;

    settings.refineIterations[0] = 2;
    settings.refineIterations[2] = 2;

    // mode13
    settings.mode_selection[1] = false;
    settings.fastSkipTreshold_mode1 = 3;
    settings.fastSkipTreshold_mode3 = 1;
    settings.fastSkipTreshold_mode7 = 0;

    settings.refineIterations[1] = 2;
    settings.refineIterations[3] = 1;

    // mode45
    settings.mode_selection[2] = false;

    settings.mode45_channel0 = 0;
    settings.refineIterations_channel = 0;
    settings.refineIterations[4] = 2;
    settings.refineIterations[5] = 2;

    // mode6
    settings.mode_selection[3] = true;

    settings.refineIterations[6] = 1;
}

GetProfile_veryfast :: ( settings: *bc7_enc_settings )
{
    settings.channels = 3;

    // mode02
    settings.mode_selection[0] = false;
    settings.skip_mode2 = true;

    settings.refineIterations[0] = 2;
    settings.refineIterations[2] = 2;

    // mode13
    settings.mode_selection[1] = true;
    settings.fastSkipTreshold_mode1 = 3;
    settings.fastSkipTreshold_mode3 = 1;
    settings.fastSkipTreshold_mode7 = 0;

    settings.refineIterations[1] = 2;
    settings.refineIterations[3] = 1;

    // mode45
    settings.mode_selection[2] = false;

    settings.mode45_channel0 = 0;
    settings.refineIterations_channel = 0;
    settings.refineIterations[4] = 2;
    settings.refineIterations[5] = 2;

    // mode6
    settings.mode_selection[3] = true;

    settings.refineIterations[6] = 1;
}

GetProfile_fast:: ( settings: *bc7_enc_settings )
{   
    settings.channels = 3;

    // mode02
    settings.mode_selection[0] = false;
    settings.skip_mode2 = true;

    settings.refineIterations[0] = 2;
    settings.refineIterations[2] = 2;

    // mode13
    settings.mode_selection[1] = true;
    settings.fastSkipTreshold_mode1 = 12;
    settings.fastSkipTreshold_mode3 = 4;
    settings.fastSkipTreshold_mode7 = 0;

    settings.refineIterations[1] = 2;
    settings.refineIterations[3] = 1;

    // mode45
    settings.mode_selection[2] = false;

    settings.mode45_channel0 = 0;
    settings.refineIterations_channel = 0;
    settings.refineIterations[4] = 2;
    settings.refineIterations[5] = 2;

    // mode6
    settings.mode_selection[3] = true;

    settings.refineIterations[6] = 2;
}

GetProfile_basic:: ( settings: *bc7_enc_settings )
{   
    settings.channels = 3;

    // mode02
    settings.mode_selection[0] = true;
    settings.skip_mode2 = true;

    settings.refineIterations[0] = 2;
    settings.refineIterations[2] = 2;

    // mode13
    settings.mode_selection[1] = true;
    settings.fastSkipTreshold_mode1 = 8+4;
    settings.fastSkipTreshold_mode3 = 8;
    settings.fastSkipTreshold_mode7 = 0;

    settings.refineIterations[1] = 2;
    settings.refineIterations[3] = 2;

    // mode45
    settings.mode_selection[2] = true;

    settings.mode45_channel0 = 0;
    settings.refineIterations_channel = 2;
    settings.refineIterations[4] = 2;
    settings.refineIterations[5] = 2;

    // mode6
    settings.mode_selection[3] = true;

    settings.refineIterations[6] = 2;
}

GetProfile_slow:: ( settings: *bc7_enc_settings )
{   
    settings.channels = 3;

    moreRefine: s32 = 2;
    // mode02
    settings.mode_selection[0] = true;
    settings.skip_mode2 = false;

    settings.refineIterations[0] = 2+moreRefine;
    settings.refineIterations[2] = 2+moreRefine;

    // mode13
    settings.mode_selection[1] = true;
    settings.fastSkipTreshold_mode1 = 64;
    settings.fastSkipTreshold_mode3 = 64;
    settings.fastSkipTreshold_mode7 = 0;

    settings.refineIterations[1] = 2+moreRefine;
    settings.refineIterations[3] = 2+moreRefine;

    // mode45
    settings.mode_selection[2] = true;

    settings.mode45_channel0 = 0;
    settings.refineIterations_channel = 2+moreRefine;
    settings.refineIterations[4] = 2+moreRefine;
    settings.refineIterations[5] = 2+moreRefine;

    // mode6
    settings.mode_selection[3] = true;

    settings.refineIterations[6] = 2+moreRefine;
}

GetProfile_alpha_ultrafast :: ( settings: *bc7_enc_settings )
{   
    settings.channels = 4;

    // mode02
    settings.mode_selection[0] = false;
    settings.skip_mode2 = true;

    settings.refineIterations[0] = 2;
    settings.refineIterations[2] = 2;

    // mode137
    settings.mode_selection[1] = false;
    settings.fastSkipTreshold_mode1 = 0;
    settings.fastSkipTreshold_mode3 = 0;
    settings.fastSkipTreshold_mode7 = 4;

    settings.refineIterations[1] = 1;
    settings.refineIterations[3] = 1;
    settings.refineIterations[7] = 2;

    // mode45
    settings.mode_selection[2] = true;
    
    settings.mode45_channel0 = 3;
    settings.refineIterations_channel = 1;
    settings.refineIterations[4] = 1;
    settings.refineIterations[5] = 1;

    // mode6
    settings.mode_selection[3] = true;

    settings.refineIterations[6] = 2;
}

GetProfile_alpha_veryfast :: ( settings: *bc7_enc_settings )
{   
    settings.channels = 4;

    // mode02
    settings.mode_selection[0] = false;
    settings.skip_mode2 = true;

    settings.refineIterations[0] = 2;
    settings.refineIterations[2] = 2;

    // mode137
    settings.mode_selection[1] = true;
    settings.fastSkipTreshold_mode1 = 0;
    settings.fastSkipTreshold_mode3 = 0;
    settings.fastSkipTreshold_mode7 = 4;

    settings.refineIterations[1] = 1;
    settings.refineIterations[3] = 1;
    settings.refineIterations[7] = 2;

    // mode45
    settings.mode_selection[2] = true;
    
    settings.mode45_channel0 = 3;
    settings.refineIterations_channel = 2;
    settings.refineIterations[4] = 2;
    settings.refineIterations[5] = 2;

    // mode6
    settings.mode_selection[3] = true;

    settings.refineIterations[6] = 2;
}

GetProfile_alpha_fast :: ( settings: *bc7_enc_settings )
{   
    settings.channels = 4;

    // mode02
    settings.mode_selection[0] = false;
    settings.skip_mode2 = true;

    settings.refineIterations[0] = 2;
    settings.refineIterations[2] = 2;

    // mode137
    settings.mode_selection[1] = true;
    settings.fastSkipTreshold_mode1 = 4;
    settings.fastSkipTreshold_mode3 = 4;
    settings.fastSkipTreshold_mode7 = 8;

    settings.refineIterations[1] = 1;
    settings.refineIterations[3] = 1;
    settings.refineIterations[7] = 2;

    // mode45
    settings.mode_selection[2] = true;
    
    settings.mode45_channel0 = 3;
    settings.refineIterations_channel = 2;
    settings.refineIterations[4] = 2;
    settings.refineIterations[5] = 2;

    // mode6
    settings.mode_selection[3] = true;

    settings.refineIterations[6] = 2;
}

GetProfile_alpha_basic :: ( settings: *bc7_enc_settings )
{   
    settings.channels = 4;

    // mode02
    settings.mode_selection[0] = true;
    settings.skip_mode2 = true;

    settings.refineIterations[0] = 2;
    settings.refineIterations[2] = 2;

    // mode137
    settings.mode_selection[1] = true;
    settings.fastSkipTreshold_mode1 = 8+4;
    settings.fastSkipTreshold_mode3 = 8;
    settings.fastSkipTreshold_mode7 = 8;

    settings.refineIterations[1] = 2;
    settings.refineIterations[3] = 2;
    settings.refineIterations[7] = 2;

    // mode45
    settings.mode_selection[2] = true;
    
    settings.mode45_channel0 = 0;
    settings.refineIterations_channel = 2;
    settings.refineIterations[4] = 2;
    settings.refineIterations[5] = 2;

    // mode6
    settings.mode_selection[3] = true;

    settings.refineIterations[6] = 2;
}

GetProfile_alpha_slow :: ( settings: *bc7_enc_settings )
{   
    settings.channels = 4;

    moreRefine: s32 = 2;
    // mode02
    settings.mode_selection[0] = true;
    settings.skip_mode2 = false;

    settings.refineIterations[0] = 2+moreRefine;
    settings.refineIterations[2] = 2+moreRefine;

    // mode137
    settings.mode_selection[1] = true;
    settings.fastSkipTreshold_mode1 = 64;
    settings.fastSkipTreshold_mode3 = 64;
    settings.fastSkipTreshold_mode7 = 64;

    settings.refineIterations[1] = 2+moreRefine;
    settings.refineIterations[3] = 2+moreRefine;
    settings.refineIterations[7] = 2+moreRefine;

    // mode45
    settings.mode_selection[2] = true;

    settings.mode45_channel0 = 0;
    settings.refineIterations_channel = 2+moreRefine;
    settings.refineIterations[4] = 2+moreRefine;
    settings.refineIterations[5] = 2+moreRefine;

    // mode6
    settings.mode_selection[3] = true;

    settings.refineIterations[6] = 2+moreRefine;
}

GetProfile_bc6h_veryfast :: ( settings: *bc6h_enc_settings )
{
    settings.slow_mode = false;
    settings.fast_mode = true;
    settings.fastSkipTreshold = 0;
    settings.refineIterations_1p = 0;
    settings.refineIterations_2p = 0;
}

GetProfile_bc6h_fast :: ( settings: *bc6h_enc_settings )
{
    settings.slow_mode = false;
    settings.fast_mode = true;
    settings.fastSkipTreshold = 2;
    settings.refineIterations_1p = 0;
    settings.refineIterations_2p = 1;
}

GetProfile_bc6h_basic :: ( settings: *bc6h_enc_settings )
{
    settings.slow_mode = false;
    settings.fast_mode = false;
    settings.fastSkipTreshold = 4;
    settings.refineIterations_1p = 2;
    settings.refineIterations_2p = 2;
}

GetProfile_bc6h_slow :: ( settings: *bc6h_enc_settings )
{
    settings.slow_mode = true;
    settings.fast_mode = false;
    settings.fastSkipTreshold = 10;
    settings.refineIterations_1p = 2;
    settings.refineIterations_2p = 2;
}

GetProfile_bc6h_veryslow :: ( settings: *bc6h_enc_settings )
{
    settings.slow_mode = true;
    settings.fast_mode = false;
    settings.fastSkipTreshold = 32;
    settings.refineIterations_1p = 2;
    settings.refineIterations_2p = 2;
}

CompressBlocksBC1_ispc :: ( src: *rgba_surface, dst: *u8 ) #foreign ispclib;
CompressBlocksBC3_ispc :: ( src: *rgba_surface, dst: *u8 ) #foreign ispclib;
CompressBlocksBC4_ispc :: ( src: *rgba_surface, dst: *u8 ) #foreign ispclib;
CompressBlocksBC5_ispc :: ( src: *rgba_surface, dst: *u8 ) #foreign ispclib;
CompressBlocksBC6H_ispc :: ( src: *rgba_surface, dst: *u8, settings: *bc6h_enc_settings ) #foreign ispclib;
CompressBlocksBC7_ispc :: ( src: *rgba_surface, dst: *u8, settings: *bc7_enc_settings ) #foreign ispclib;

#scope_file

#if OS == .WINDOWS  ispclib :: #foreign_library, no_dll "win/ispc_texcomp";
#if OS == .MACOS    ispclib :: #foreign_library, no_dll "macos/ispc_texcomp";
#if OS == .LINUX    ispclib :: #foreign_library, no_dll "linux/ispc_texcomp";