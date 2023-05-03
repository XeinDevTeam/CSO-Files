"Popup_VoxelOutUI_ImageUploadViewDlg"
{
	"VoxelOutUI_ImageUploadViewDlg"
	{
		"ControlName"		"CVoxelOutUI_ImageUploadDlg"
		"fieldName"			"VoxelOutUI_ImageUploadViewDlg"
		"xpos"				"0"
		"ypos"				"0"
		"wide"				"541"
		"tall"				"485"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"paintbackground"	"1"
		"title"				"#Vxl_OutUI_ImageUploadView_Title"
	}

	"ImgUploadViewDlg_Description"
	{
		"ControlName"		"Label"
		"fieldName"			"ImgUploadViewDlg_Description"
		"xpos"				"29"
		"ypos"				"39"
		"wide"				"474"
		"tall"				"136"
		"labelText"			"#Vxl_OutUI_ImageUploadView_Desc"
	}

	"ImgUploadViewDlg_Cancel_Btn"
	{
		"ControlName"		"Button"
		"fieldName"			"ImgUploadViewDlg_Cancel_Btn"
		"xpos"				"406"
		"ypos"				"431"
		"wide"				"98"
		"tall"				"32"
		"labelText"			"#CSO_Cancel"
		"Command" 			"Close"
	}

	"ImgUploadViewDlg_Upload_Btn"
	{
		"ControlName"		"Button"
		"fieldName"			"ImgUploadViewDlg_Upload_Btn"
		"xpos"				"301"
		"ypos"				"431"
		"wide"				"98"
		"tall"				"32"
		"labelText"			"#Vxl_OutUI_ImageUploadView_Upload"
		"Command" 			"ReqImgUpload"
	}

	"ImgUploadViewDlg_Image_Bg"
	{
		"ControlName"		"NinePicsPanel"
		"fieldName"			"ImgUploadViewDlg_Image_Bg"
		"xpos"				"16"
		"ypos"				"198"
		"wide"				"499"
		"tall"				"219"
		"NinePicsTgaPath"	"resource/zmstate/graph_bg"
		"zpos"				"0"
		"scaleImage"		"1"
	}

	"ImgUploadViewDlg_PolicyCheck_Btn"
	{
		"ControlName"			"ThreePicsButton"
		"fieldName"				"ImgUploadViewDlg_PolicyCheck_Btn"
		"xpos"					"29"
		"ypos"					"431"
		"wide"					"120"
		"tall"					"32"
		"zpos"					"2"
		"ThreePicsTgaPath"		"resource/Control/Button/btn_invensort"
		"scaleImage"			"1"
		"Font"					"ChatDefault"
		"labelText"				"#Vxl_OutUI_PolicyCheck_WebLink_Btn"
		"EnableForceTextColor"	"1"
		"ForceTextColor"		"168 168 168 255"
		"Command"				"Policy_Check"
	}		
}