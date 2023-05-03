"Popup_Voxeloutui"
{
	"VoxeloutuiDlg"
	{
		"ControlName"		"CVoxeloutuiDlg"
		"fieldName"			"VoxeloutuiDlg"
		"xpos"				"0"
		"ypos"				"0"
		"wide"				"932"
		"tall"				"694"
		"zpos"				"0"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
		"paintbackground"	"1"
	}

	"TitleLabel"
	{
		"ControlName"				"Label"
		"fieldName"					"TitleLabel"
		"xpos"						"27"
		"ypos"						"19"
		"wide"						"868"
		"tall"						"36"
		"zpos"						"1"
		"labelText"					"#Vxl_OutUI_Title"
		"font"						"ResultTitle"
		"wrap"						"0"
		"textAlignment"				"center"
		"EnableForceTextColor"		"1"
		"ForceTextColor"			"250 230 171 255"
	}

	"ServerSyncInfo_Label"
	{
		"ControlName"				"Label"
		"fieldName"					"ServerSyncInfo_Label"
		"xpos"						"175"
		"ypos"						"640"
		"wide"						"455"
		"tall"						"12"		
		"zpos"						"3"
		"font"						"ChatDefault"
		"visible"					"0"
		"EnableForceTextColor"		"1"
		"ForceTextColor"			"100 100 100 255"
		"labelText"					"#Vxl_OutUI_ServerSyncInfo_All"
	}


	"Cancle_Btn"
	{
		"ControlName"				"Button"
		"fieldName"					"Cancle_Btn"
		"xpos"						"797"
		"ypos"						"640"
		"wide"						"98"
		"tall"						"32"
		"zpos"						"1"
		"font"						"ChatDefault"
		"labelText"					"#Vxl_OutUI_Close"
		"EnableForceTextColor"		"1"
		"ForceTextColor"			"168 168 168 255"		
		"Command"					"Close"
	}

	"GoToRoomList_Btn"
	{
		"ControlName"				"ThreePicsButton"
		"fieldName"					"GoToRoomList_Btn"
		"xpos"						"665"
		"ypos"						"640"
		"wide"						"124"
		"tall"						"32"
		"zpos"						"1"
		"ThreePicsTgaPath"			"resource/Control/Button/btn_invensort"
		"scaleImage"				"1"
		"font"						"ChatDefault"
		"labelText"					"#Vxl_OutUI_RoomList"
		"EnableForceTextColor"		"1"
		"ForceTextColor"			"184 217 236 255"		
		"command"					"GoToRoomList"
	}
}
 