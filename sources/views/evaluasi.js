import {JetView} from "webix-jet";
import TambahWinView from "views/tambahWin";

var routeUrl = window.location.protocol +"//"+ window.location.hostname+window.location.pathname;

export default class EvaluasiView extends JetView{
	config(){
		return {
			"rows": [
				{
					"css": "webix_dark",
					"view": "toolbar",
					"cols": [
						{ id:"lb","view": "label", "label": "Evaluasi CSMS" },
						{ "view": "button", "label": "Tambah Kontraktor Baru", "autowidth": true,
							click:() => this.app.show("/top/tambah")
							//click:() => this.win.showWindow();
							
						}
					]
				},
				{	
					id:"tbl_perusahaan",
					"view": "datatable",
					"columns": [
						{ "id": "nama", "header": "Nama Perusahaan", "fillspace": true, "sort": "string", "hidden": false },
						{ "id": "alamat", "header": "Alamat", "sort": "string", "fillspace": true, "hidden": false },
						{ "id": "telepon", "header": "Telepon/ Fax", "sort": "string", "fillspace": false, "hidden": false, width:200 },
						{ id:"penilaian",	header:"", width:150,
							template:function(obj){ 
							return "<div class='webix_el_button'><button class='penilaian'> Penilaian Elemen</button></div>";
							}
						},
						{ header:"", template:"{common.trashIcon()}", width:40}
					],
					"url": routeUrl+"perusahaan",
					select:true,
					onClick:{
						penilaian:function(ev, id, html){
						 	this.$scope.show("/top/penilaian?id="+id);
						},
						"wxi-trash":function(event, id, node){
                            webix.confirm("Anda yakin akan menghapus data ?").then(function(result){
                                webix.ajax().post("perusahaan/delete/"+id).then(() => webix.message("Data sudah dihapus"));
                                $$("tbl_perusahaan").remove(id);
                            });
                        }  
					  },
					on:{
						"onAfterSelect":function(id){
							// var item = this.getSelectedItem();
							// var pt = item.nama;
							// $$('btn_penilaian').enable();
							// $$('label_pt').setValue('Nama Kontraktor : ' + pt);
						}
					}
				},
				// {
				// 	"css": "webix_dark",
				// 	"view": "toolbar",
				// 	"cols": [
				// 		{ id:"btn_penilaian", "view": "button", "label": "Penilaian Elemen CSMS", "autowidth": true, disabled:true,
				// 			click:()=>{
                //                 //var id = $$("tbl_kontraktor").getSelectedId();
				// 				//this.app.show("/top/penilaian?id="+id);
				// 				this.app.show("/top/penilaian?id=");
				// 			}
				// 		},
				// 		{ id:"label_pt", "view": "label", value:""},
				// 	]
				// }
			]
		}
	}
    init(){
		this.win = this.ui(TambahWinView);
		//$$("tbl_perusahaan").load("/perusahaan");
    }
}