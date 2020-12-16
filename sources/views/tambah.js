import {JetView} from "webix-jet";

var routeUrl = window.location.protocol +"//"+ window.location.hostname+window.location.pathname;

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
				{ paddingX:20, paddingY:20, "autoheight": false, "view": "form", "type": "wide", "elementsConfig": { "required": true, "labelPosition": "top" },
					"rows": [
						{ id:"id", name:"id", "label": "ID", "view": "text", "labelPosition": "top", hidden:true },
                        { name:"nama", "view": "text", "label": "Nama Perusahaan"},
						{ name:"alamat", "view": "text", "label": "Alamat"},
						{ name:"telepon", "label": "Telepon/ Fax", "view": "text"},
						{
							cols:[
								{ id:"btn_simpan_","view": "button", "css": "webix_primary", "label": "Simpan", click:function(){																			
									var form = this.getFormView();
									if (form.validate()){
										var data = form.getValues();
										webix.ajax().post(routeUrl+"perusahaan/save", data).then(() => {
											webix.message("Kontraktor baru sudah di tambah")
											form.load(routeUrl+"perusahaan/newData")
										});
										//form.clear();
										$$("btn_simpan_").disable();
										$$("btn_lanjut_").enable();

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
						{ id:"btn_lanjut_","css": "webix_danger", "view": "button", disabled:true, label:"Lanjut Penilaian Elemen CSMS", width:300,
						click:()=>{
							var id = $$("id").getValue();
							this.app.show("/top/penilaian?id="+id)
						}
					}
					]
				},
			]
		}
	}
}