(*
 * Copyright(c) 2024 Embarcadero Technologies, Inc.
 *
 * This code was generated by the TaskGen tool from file
 *   "CLANGTask.xml"
 * Version: 29.0.0.0
 * Runtime Version: v4.0.30319
 * Changes to this file may cause incorrect behavior and will be
 * overwritten when the code is regenerated.
 *)

unit CLANGStrs;

interface

const

	sTaskName = 'clang';

	// CLANGPreprocessor
	sRunPreprocessor = 'CLANG_RunPreprocessor';

	// CLANGDirectoriesAndConditionals
	sDefines = 'CLANG_Defines';
	sInternalDefines = 'CLANG_InternalDefines';
	sUndefines = 'CLANG_Undefines';
	sTargetOutputDir = 'CLANG_TargetOutputDir';
	sOutputDir = 'CLANG_OutputDir';
	sSysRoot = 'CLANG_SysRoot';
	sIWithSysRoot = 'CLANG_IWithSysRoot';
	sIDirAfter = 'CLANG_IDirAfter';
	sIncludePath = 'CLANG_IncludePath';
	sSysIncludePath = 'CLANG_SysIncludePath';
	sSystemIncludePath = 'CLANG_SystemIncludePath';
	sFrameworkRoot = 'CLANG_FrameworkRoot';
	sWindowsVersionDefines = 'CLANG_WindowsVersionDefines';
		sWindowsVersionDefines_Unspecified = 'Unspecified';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN10_19H1__WIN32_WINNT__WIN32_WINNT_WIN10 = 'NTDDI_VERSION=NTDDI_WIN10_19H1;_WIN32_WINNT=_WIN32_WINNT_WIN10';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN10_RS5__WIN32_WINNT__WIN32_WINNT_WIN10 = 'NTDDI_VERSION=NTDDI_WIN10_RS5;_WIN32_WINNT=_WIN32_WINNT_WIN10';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN10_RS4__WIN32_WINNT__WIN32_WINNT_WIN10 = 'NTDDI_VERSION=NTDDI_WIN10_RS4;_WIN32_WINNT=_WIN32_WINNT_WIN10';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN10_RS3__WIN32_WINNT__WIN32_WINNT_WIN10 = 'NTDDI_VERSION=NTDDI_WIN10_RS3;_WIN32_WINNT=_WIN32_WINNT_WIN10';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN10_RS2__WIN32_WINNT__WIN32_WINNT_WIN10 = 'NTDDI_VERSION=NTDDI_WIN10_RS2;_WIN32_WINNT=_WIN32_WINNT_WIN10';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN10_RS1__WIN32_WINNT__WIN32_WINNT_WIN10 = 'NTDDI_VERSION=NTDDI_WIN10_RS1;_WIN32_WINNT=_WIN32_WINNT_WIN10';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN10_TH2__WIN32_WINNT__WIN32_WINNT_WIN10 = 'NTDDI_VERSION=NTDDI_WIN10_TH2;_WIN32_WINNT=_WIN32_WINNT_WIN10';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN10__WIN32_WINNT__WIN32_WINNT_WIN10 = 'NTDDI_VERSION=NTDDI_WIN10;_WIN32_WINNT=_WIN32_WINNT_WIN10';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WINBLUE__WIN32_WINNT__WIN32_WINNT_WINBLUE = 'NTDDI_VERSION=NTDDI_WINBLUE;_WIN32_WINNT=_WIN32_WINNT_WINBLUE';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN8__WIN32_WINNT__WIN32_WINNT_WIN8 = 'NTDDI_VERSION=NTDDI_WIN8;_WIN32_WINNT=_WIN32_WINNT_WIN8';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN7__WIN32_WINNT__WIN32_WINNT_WIN7 = 'NTDDI_VERSION=NTDDI_WIN7;_WIN32_WINNT=_WIN32_WINNT_WIN7';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WS08__WIN32_WINNT__WIN32_WINNT_WS08 = 'NTDDI_VERSION=NTDDI_WS08;_WIN32_WINNT=_WIN32_WINNT_WS08';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_VISTASP1__WIN32_WINNT__WIN32_WINNT_VISTA = 'NTDDI_VERSION=NTDDI_VISTASP1;_WIN32_WINNT=_WIN32_WINNT_VISTA';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_LONGHORN__WIN32_WINNT__WIN32_WINNT_LONGHORN = 'NTDDI_VERSION=NTDDI_LONGHORN;_WIN32_WINNT=_WIN32_WINNT_LONGHORN';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WS03SP2__WIN32_WINNT__WIN32_WINNT_WS03 = 'NTDDI_VERSION=NTDDI_WS03SP2;_WIN32_WINNT=_WIN32_WINNT_WS03';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WS03SP1__WIN32_WINNT__WIN32_WINNT_WS03 = 'NTDDI_VERSION=NTDDI_WS03SP1;_WIN32_WINNT=_WIN32_WINNT_WS03';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WS03__WIN32_WINNT__WIN32_WINNT_WS03 = 'NTDDI_VERSION=NTDDI_WS03;_WIN32_WINNT=_WIN32_WINNT_WS03';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WINXPSP3__WIN32_WINNT__WIN32_WINNT_WINXP = 'NTDDI_VERSION=NTDDI_WINXPSP3;_WIN32_WINNT=_WIN32_WINNT_WINXP';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WINXPSP2__WIN32_WINNT__WIN32_WINNT_WINXP = 'NTDDI_VERSION=NTDDI_WINXPSP2;_WIN32_WINNT=_WIN32_WINNT_WINXP';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WINXPSP1__WIN32_WINNT__WIN32_WINNT_WINXP = 'NTDDI_VERSION=NTDDI_WINXPSP1;_WIN32_WINNT=_WIN32_WINNT_WINXP';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WINXP__WIN32_WINNT__WIN32_WINNT_WINXP = 'NTDDI_VERSION=NTDDI_WINXP;_WIN32_WINNT=_WIN32_WINNT_WINXP';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN2KSP4__WIN32_WINNT__WIN32_WINNT_WIN2K = 'NTDDI_VERSION=NTDDI_WIN2KSP4;_WIN32_WINNT=_WIN32_WINNT_WIN2K';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN2KSP3__WIN32_WINNT__WIN32_WINNT_WIN2K = 'NTDDI_VERSION=NTDDI_WIN2KSP3;_WIN32_WINNT=_WIN32_WINNT_WIN2K';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN2KSP2__WIN32_WINNT__WIN32_WINNT_WIN2K = 'NTDDI_VERSION=NTDDI_WIN2KSP2;_WIN32_WINNT=_WIN32_WINNT_WIN2K';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN2KSP1__WIN32_WINNT__WIN32_WINNT_WIN2K = 'NTDDI_VERSION=NTDDI_WIN2KSP1;_WIN32_WINNT=_WIN32_WINNT_WIN2K';
		sWindowsVersionDefines_NTDDI_VERSION_NTDDI_WIN2K__WIN32_WINNT__WIN32_WINNT_WIN2K = 'NTDDI_VERSION=NTDDI_WIN2K;_WIN32_WINNT=_WIN32_WINNT_WIN2K';
		sWindowsVersionDefines__WIN32_WINDOWS_0x500_WINVER_0x500 = '_WIN32_WINDOWS=0x500;WINVER=0x500';
		sWindowsVersionDefines__WIN32_WINDOWS_0x410_WINVER_0x410 = '_WIN32_WINDOWS=0x410;WINVER=0x410';
		sWindowsVersionDefines__WIN32_WINDOWS_0x400_WINVER_0x400 = '_WIN32_WINDOWS=0x400;WINVER=0x400';
	sAddProjectDirToIncludePath = 'CLANG_AddProjectDirToIncludePath';

	// CLANGDebugging
	sSourceDebuggingOn = 'CLANG_SourceDebuggingOn';
	sExtendedDebugInfo_v15 = 'CLANG_ExtendedDebugInfo_v15';
	sDWARFVersion = 'CLANG_DWARFVersion';
	sExternalTypes = 'CLANG_ExternalTypes';
	sUseSplitDWARF = 'CLANG_UseSplitDWARF';
	sDwoOutput = 'CLANG_DwoOutput';

	// GeneralCompilation
	sDisableCPPAccesControls = 'CLANG_DisableCPPAccesControls';
	sDisableRttiGenerationInfo = 'CLANG_DisableRttiGenerationInfo';
	sEnableCPPExceptions = 'CLANG_EnableCPPExceptions';
	sDisableFramePtrElimOpt = 'CLANG_DisableFramePtrElimOpt';
	sDisableFramePtrElimOpt_v15 = 'CLANG_DisableFramePtrElimOpt_v15';
	sUseRelaxableRelocations_v15 = 'CLANG_UseRelaxableRelocations_v15';
	sClearClangASTBeforeCodeGen_v15 = 'CLANG_ClearClangASTBeforeCodeGen_v15';
	sEnableFloatFusionOperation_v15 = 'CLANG_EnableFloatFusionOperation_v15';
	sForceFloatRoundingMode_v15 = 'CLANG_ForceFloatRoundingMode_v15';
	sForceLongDouble64_v15 = 'CLANG_ForceLongDouble64_v15';
	sSetGCCVersionCompatibility_v15 = 'CLANG_SetGCCVersionCompatibility_v15';
	sSetStructureLayoutToMSStandard_v15 = 'CLANG_SetStructureLayoutToMSStandard_v15';
	sUseGlobalRelaxable_v15 = 'CLANG_UseGlobalRelaxable_v15';
	sEnableVectorizeLoops_v15 = 'CLANG_EnableVectorizeLoops_v15';
	sEnableVectorizeSLP_v15 = 'CLANG_EnableVectorizeSLP_v15';
	sBorlandExtensions = 'CLANG_BorlandExtensions';
	sBorlandDiagnosticFormat = 'CLANG_BorlandDiagnosticFormat';
	sBorlandRTTI = 'CLANG_BorlandRTTI';
	sBorlandAutoRefCount = 'CLANG_BorlandAutoRefCount';
	sCatchUndefinedBehavior = 'CLANG_CatchUndefinedBehavior';
	sNoBuiltInc = 'CLANG_NoBuiltInc';
	sNoImplicitFloat = 'CLANG_NoImplicitFloat';
	sNoStdSystemInc = 'CLANG_NoStdSystemInc';
	sTargetTriple = 'CLANG_TargetTriple';
	sShortEnum = 'CLANG_ShortEnum';
	sDataAlignment = 'CLANG_DataAlignment';
		sDataAlignment_Byte = 'Byte';
		sDataAlignment_Word = 'Word';
		sDataAlignment_DWord = 'DWord';
		sDataAlignment_QWord = 'QWord';
		sDataAlignment_Paragraph = 'Paragraph';
	sEmitPCH = 'CLANG_EmitPCH';
	sIncludePCH = 'CLANG_IncludePCH';
	sEmitNativeObject = 'CLANG_EmitNativeObject';
	sEmitNativeAssembly = 'CLANG_EmitNativeAssembly';
	sUseBorlandABI = 'CLANG_UseBorlandABI';
	sGenObjFileUsingLLVM = 'CLANG_GenObjFileUsingLLVM';
	sEmitConstructorAliases = 'CLANG_EmitConstructorAliases';
	sRelocationModel = 'CLANG_RelocationModel';
	sUsePosIndCodeForObjectFile = 'CLANG_UsePosIndCodeForObjectFile';
	sGenVerboseAssemblyOutput = 'CLANG_GenVerboseAssemblyOutput';
	sTargetABI = 'CLANG_TargetABI';
	sTargetCPU = 'CLANG_TargetCPU';
		sTargetCPU_arm7tdmi = 'arm7tdmi';
		sTargetCPU_arm10tdmi = 'arm10tdmi';
		sTargetCPU_arm1022e = 'arm1022e';
		sTargetCPU_arm926ej_s = 'arm926ej-s';
		sTargetCPU_arm1176jzf_s = 'arm1176jzf-s';
		sTargetCPU_arm1156t2_s = 'arm1156t2-s';
		sTargetCPU_cortex_m0 = 'cortex-m0';
		sTargetCPU_cortex_a8 = 'cortex-a8';
		sTargetCPU_cortex_m4 = 'cortex-m4';
		sTargetCPU_cortex_a9_mp = 'cortex-a9-mp';
		sTargetCPU_swift = 'swift';
		sTargetCPU_cortex_m3 = 'cortex-m3';
		sTargetCPU_ep9312 = 'ep9312';
		sTargetCPU_iwmmxt = 'iwmmxt';
		sTargetCPU_xscale = 'xscale';
	sTuneCPU = 'CLANG_TuneCPU';
		sTuneCPU_generic = 'generic';
	sUseFloatABI = 'CLANG_UseFloatABI';
		sUseFloatABI_Unspecified = 'Unspecified';
		sUseFloatABI_soft = 'soft';
		sUseFloatABI_softfp = 'softfp';
		sUseFloatABI_hard = 'hard';
	sOnlyFramePointer = 'CLANG_OnlyFramePointer';
	sFunctionSections = 'CLANG_FunctionSections';
	sUseSoftFloatingPoint = 'CLANG_UseSoftFloatingPoint';
	sNotUseCppHeaders = 'CLANG_NotUseCppHeaders';
	sDefineDeprecatedMacros = 'CLANG_DefineDeprecatedMacros';
	sMacMessageLenght = 'CLANG_MacMessageLenght';
	sEnableBlocksLangFeature = 'CLANG_EnableBlocksLangFeature';
	sUseSjLjExcpetions = 'CLANG_UseSjLjExcpetions';
	sUseMappableDiagnostics = 'CLANG_UseMappableDiagnostics';
	sUseColorsDiagnostics = 'CLANG_UseColorsDiagnostics';
	sEmitLLVM = 'CLANG_EmitLLVM';
	sEnableExceptions = 'CLANG_EnableExceptions';
	sSEH = 'CLANG_SEH';
	sSEH_v15 = 'CLANG_SEH_v15';
	sUnwindTables = 'CLANG_UnwindTables';
	sUnwindTables_v15 = 'CLANG_UnwindTables_v15';
	sStackRealign = 'CLANG_StackRealign';
	sStackAlign = 'CLANG_StackAlign';
	sCPPCompileAlways = 'CLANG_CPPCompileAlways';
	sEnableBatchCompilation = 'CLANG_EnableBatchCompilation';
	sStopBatchAfterWarnings = 'CLANG_StopBatchAfterWarnings';
	sStopBatchAfterErrors = 'CLANG_StopBatchAfterErrors';
	sStopBatchAfterFirstError = 'CLANG_StopBatchAfterFirstError';
	sNoCommon = 'CLANG_NoCommon';
	sDisableSpellChecking = 'CLANG_DisableSpellChecking';
	sNo__cxa_atexit_ForDestructors = 'CLANG_No__cxa_atexit_ForDestructors';
	sNoThreadsafeStatics = 'CLANG_NoThreadsafeStatics';
	sMainFileName = 'CLANG_MainFileName';
	sInputLanguageType = 'CLANG_InputLanguageType';
		sInputLanguageType_c__ = 'c++';
		sInputLanguageType_c = 'c';
	sLanguageStandard = 'CLANG_LanguageStandard';
		sLanguageStandard_c89 = 'c89';
		sLanguageStandard_c90 = 'c90';
		sLanguageStandard_c99 = 'c99';
		sLanguageStandard_c11 = 'c11';
		sLanguageStandard_c__11 = 'c++11';
		sLanguageStandard_c__14 = 'c++14';
		sLanguageStandard_c__17 = 'c++17';
	sDisableOptimizations = 'CLANG_DisableOptimizations';
	sOptimizeForSize = 'CLANG_OptimizeForSize';
	sOptimizeForSizeIgnoreSpeed = 'CLANG_OptimizeForSizeIgnoreSpeed';
	sOptimizeForSpeed = 'CLANG_OptimizeForSpeed';
	sOptimizeMaximum = 'CLANG_OptimizeMaximum';
	sOptimizationLevel = 'CLANG_OptimizationLevel';
		sOptimizationLevel_None = 'None';
		sOptimizationLevel_Level1 = 'Level1';
		sOptimizationLevel_Level2 = 'Level2';
		sOptimizationLevel_Level3 = 'Level3';
	sPredefineMacro = 'CLANG_PredefineMacro';
	sSetErrorLimit = 'CLANG_SetErrorLimit';
	sUndefineMacro = 'CLANG_UndefineMacro';

	// CLANGAdvanced
	sUserSuppliedOptions = 'CLANG_UserSuppliedOptions';
	sRemappingFile = 'CLANG_RemappingFile';
	sRemoveTmpVFSFiles = 'CLANG_RemoveTmpVFSFiles';
	sVFSOverlayFile = 'CLANG_VFSOverlayFile';
	sRequireMathFuncErrorNumber = 'CLANG_RequireMathFuncErrorNumber';

	// CLANGTarget
	sLinkWithDynamicRTL = 'CLANG_LinkWithDynamicRTL';
	sGenerateConsoleApp = 'CLANG_GenerateConsoleApp';
	sGeneratePackage = 'CLANG_GeneratePackage';
	sGenerateDLL = 'CLANG_GenerateDLL';
	sGenerateMultithreaded = 'CLANG_GenerateMultithreaded';
	sGenerateUnicode = 'CLANG_GenerateUnicode';
	sGenerateWindowsApp = 'CLANG_GenerateWindowsApp';

	// CLANGPrecompiledHeaders
	sPCHName = 'CLANG_PCHName';
	sPCHUsage = 'CLANG_PCHUsage';
		sPCHUsage_None = 'None';
		sPCHUsage_GenerateAndUse = 'GenerateAndUse';
		sPCHUsage_UseDontGenerate = 'UseDontGenerate';

	// CLANGOutput
	sUTF8Output = 'CLANG_UTF8Output';
	sOutputFilename = 'CLANG_OutputFilename';
	sAutoDependencyOutput = 'CLANG_AutoDependencyOutput';
	sDependencyFile = 'CLANG_DependencyFile';
	sDependencyFileTarget = 'CLANG_DependencyFileTarget';
	sParallelDependencies = 'CLANG_ParallelDependencies';
	sSubProcessesNumber = 'CLANG_SubProcessesNumber';
	sDependencyIncDepHeaders = 'CLANG_DependencyIncDepHeaders';

	// CLANGWarnings
	sWarningIsError = 'CLANG_WarningIsError';
	sAllWarnings = 'CLANG_AllWarnings';
	sDisableWarnings = 'CLANG_DisableWarnings';

	// CLANGOptimizations
	// Outputs
	sOutput_ObjFiles = 'ObjFiles';
	sOutput_PrecompiledHeaderFile = 'PrecompiledHeaderFile';

implementation

end.
