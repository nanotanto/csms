import {JetView} from "webix-jet";

export default class TambahView extends JetView{
	config(){
		return {
			"rows": [
				{
					"css": "webix_dark",
					"view": "toolbar",
					"cols": [
						{ "view": "label", "label": "Tambah Kontraktor Baru" },
						{ "icon": "wxi-close", "view": "icon", "width": 38,
						click:()=>{
							this.app.show("/top/evaluasi")
						}
					}
					]
				},
				{ id:"form_pt_baru", paddingX:20, paddingY:20, "autoheight": false, "view": "form", "type": "wide", "elementsConfig": { "required": true, "labelPosition": "top" },
					"rows": [
						{ id:"id", name:"id", hidden:true},
						{ name:"nama", "view": "text", "label": "Nama Perusahaan", validate:"isNotEmpty"},
						{ name:"alamat", "view": "text", "label": "Alamat", validate:"isNotEmpty"},
						{ name:"telepon", "label": "Telepon/ Fax", "view": "text", validate:"isNotEmpty"},
						{
							cols:[
								{ "view": "button", "css": "webix_primary", "label": "Simpan", click:function(){																			
									var form = this.getFormView();
									if (form.validate()){
										var data = form.getValues();
										webix.ajax().post("http://localhost:8000/perusahaan/save", data).then(() => webix.message("Kontraktor baru sudah di tambah"));
										//form.clear();
										this.disable();
										$$("btn_lanjut").enable();
										form.load("http://localhost:8000/perusahaan_baru");
									}                                    
									else
										webix.message({ type:"error", text:"Form data is invalid" });
								}},{},{},{},{}
							]
						}
					],
					rules:{
					  "nama":webix.rules.isNotEmpty,
					  "alamat":webix.rules.isNotEmpty,
					  "telepon":webix.rules.isNotEmpty
					},
				},
				
				{
					"css": "webix_dark",
					"view": "toolbar",
					"cols": [
						{ "view": "label", "label": "" },
						{ id:"btn_lanjut", disabled:true, "css": "webix_danger", "view": "button", label:"Lanjut Penilaian Elemen CSMS", width:300,
						click: () => {
							var id =  $$('form_pt_baru').getValues().id;
							this.app.show("/top/penilaian?id="+id);
						}
					}
					]
				},
			]
		}
	}
}