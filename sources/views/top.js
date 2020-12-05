import {JetView, plugins} from "webix-jet";

export default class TopView extends JetView{
	config(){

		const header = {
			view:"toolbar",
			css:"webix_dark", padding:{ left:8 },
			elements:[
				{ view:"label", label:"CSMS Software" },
				{ "icon": "wxi-user", "view": "icon", "height": 38, "width": 38,
							click:()=>{
								
							}
				}
				/*wjet::Topbar*/
			]
		};

		const menu = {
			view:"sidebar", id:"top:menu", 
			width:180, layout:"y", select:true,
			template:"<span style='padding:10px' class='webix_icon #icon#'></span> #value# ",
			data:[
				{ value:"Dashboard", id:"dash", icon:"wxi-plus-square" },
				{ value:"Resume Data",		 id:"data",  icon:"wxi-columns" },
				{ value:"Evaluasi CSMS",  id:"evaluasi",  icon:"wxi-pencil" },
				/*wjet::Menu*/
			]
		};

		const ui = {
			rows:[
				header,
				{ type:"space", cols:[
					menu,
					{ $subview:true } 
					
				]}
			]
		};

		return ui;
	}

	init(){
		this.use(plugins.Menu, "top:menu");
	}
}