"Popup_VoxelOutUI_ExpandSlotDlg"
{
	"VoxelOutUI_ExpandSlotDlg"
	{
		"ControlName"		"CVoxelOutUI_ExpandSlotDlg"
		"fieldName"			"VoxelOutUI_ExpandSlotDlg"
		"xpos"				"0"
		"ypos"				"0"
		"wide"				"350"
		"tall"				"200"
		"zpos"				"0"
		"autoResize"		"0"
		"pinCorner"			"0"
		"enabled"			"1"
		"visible"			"0"
		"tabPosition"		"0"
		"title"				"#Vxl_OutUI_ExpandSlot_Title"
	}
	"Vxl_ExpandSlotDlg_Ok_Btn"
	{
		"ControlName"		"Button"
		"fieldName"			"Vxl_ExpandSlotDlg_Ok_Btn"
		"xpos"				"70"
		"ypos"				"150"
		"wide"				"100"
		"tall"				"32"
		"labelText"			"#Vxl_OutUI_Btn_OK"
		"Command"			"Btn_Ok"
	}
	"Vxl_ExpandSlotDlg_Cancle_Btn"
	{
		"ControlName"		"Button"
		"fieldName"			"Vxl_ExpandSlotDlg_Cancle_Btn"
		"xpos"				"180"
		"ypos"				"150"
		"wide"				"100"
		"tall"				"32"
		"labelText"			"#Vxl_OutUI_Btn_Close"
		"Command"			"Btn_Close"
	}
	"Vxl_ExpandSlotDlg_Desc_Label"
	{
		"ControlName"				"Label"
		"fieldName"					"Vxl_ExpandSlotDlg_Desc_Label"
		"xpos"						"25"
		"ypos"						"59"
		"wide"						"300"
		"tall"						"26"
		"zpos"						"2"
		"textAlignment"				"center"
		"Font"						"DefaultMiddle2"
		"labelText"					"#Vxl_OutUI_ExpandSlot_Desc"
		"EnableForceTextColor"		"1"
		"ForceTextColor"			"196 196 196 255"
	}
	"Vxl_ExpandSlotDlg_SelectMoneyType_Label"
	{
		"ControlName"				"Label"
		"fieldName"					"Vxl_ExpandSlotDlg_SelectMoneyType_Label"
		"xpos"						"55"
		"ypos"						"100"
		"wide"						"100"
		"tall"						"26"
		"zpos"						"2"
		"textAlignment"				"center"
		"Font"						"DefaultMiddle2"
		"labelText"					"#Vxl_OutUI_ExpandSlot_SelectMoneyType_Label"
		"EnableForceTextColor"		"1"
		"ForceTextColor"			"196 196 196 255"
	}
	"Vxl_ExpandSlot_SelectMoney_ComboBox"
	{
		"ControlName"		"ComboBox"
		"fieldName"			"Vxl_ExpandSlot_SelectMoney_ComboBox"
		"xpos"				"145"
		"ypos"				"100"
		"wide"				"127"
		"tall"				"23"
		"zpos"				"1"
		"editable"			"1"
		"maxchars"			"-1"
		"NumericInputOnly"	"0"
		"unicode"			"0"
		"font"				"ChatDefault"
	}
}

// 슬롯 확장시 팝업으로 뜨는 창입니다.
// 콤보박스에서 맵 / 이미지 2가지의 타입을 선택해서 게임 서버로 요청합니다.
// 
// Vxl_ExpandSlotDlg_Desc_Label : 슬롯 확장에 대한 설명 문구 (가격 또는 마일리지 표시)