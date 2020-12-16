import {JetView} from "webix-jet";

var routeUrl = window.location.protocol +"//"+ window.location.hostname+window.location.pathname;

export default class EvaluasiView extends JetView{
	config(){
		return { autoheight:true,
			"rows": [ 
				{
					"css": "webix_dark",
					"view": "toolbar",
					"cols": [
						{ "view": "label", "label": "Evaluasi CSMS" },
						{ "icon": "wxi-close", "view": "icon", "width": 38,
							click:()=>{
								this.app.show("/top/evaluasi")
							}
						}
					]
				},
				{ id:"form_perusahaan","autoheight": true, "view": "form", "elementsConfig": { "required": false, "labelPosition": "top" },
					"rows": [
						{
							"cols": [
								{ name:"nama", "view": "text", "label": "Nama Perusahaan", readonly:true},
								{ name:"alamat", "label": "Alamat", "view": "text", readonly:true },
								{ name:"telepon", "label": "Telepon/ Fax", "view": "text", readonly:true }
							]
						}
					]
				},
				{
					"css": "webix_dark",
					"view": "toolbar",
					"cols": [
						{ "view": "label", "label": "Penilaian Elemen" },
						{ "view": "button", "label": "Tambah Penilaian Elemen", "autowidth": true }
					]
				},
				{
					"id":"tbl_penilaian",
					scheme:{
						$init:function(row){
							row.elemen_id = (row.elemen || "") && row.elemen.penjelasan
							row.subelemen_id = (row.subelemen || "") && row.subelemen.bagian
							row.subelemen_id_name = (row.subelemen || "") && row.subelemen.penjelasan
							row.score_id = (row.score || "") && row.score.name							
						}
					},
					"columns": [
						{ "id": "perusahaan_id", "header": "Nama Perusahaan", "fillspace": false, "sort": "string", "hidden": true },
						{ "id": "elemen_id", "header": "Elemen", "sort": "string", "fillspace": false, "hidden": false },
						{ "id": "subelemen_id", "header": "", "sort": "string", "fillspace": false, "hidden": false },
						{ "id": "subelemen_id_name", "header": "Sub Elemen", "sort": "string", "fillspace": false, "hidden": false },
						{ "id": "tgl_masuk", "header": "Tgl Masuk", "sort": "string", "fillspace": false, "hidden": false },
						{ "id": "tgl_target", "header": "Tgl Target", "sort": "string", "fillspace": false, "hidden": false },
						{ "id": "tgl_selesai", "header": "Tgl Selesai", "sort": "string", "fillspace": false, "hidden": false },
						{ "id": "kesimpulan", "header": "Kesimpulan", "sort": "string", "fillspace": true, "hidden": false },
						{ "id": "score_id", "header": "Nilai", "fillspace": false, "hidden": false }
					],
					"view": "datatable",
					ready:function(){ 
						this.adjustColumn("elemen_id"); 
						this.adjustColumn("subelemen_id"); 
						this.adjustColumn("subelemen_id_name"); 
						this.adjustColumn("tgl_masuk"); 
						this.adjustColumn("tgl_target"); 
						this.adjustColumn("tgl_selesai"); 
						this.adjustColumn("kesimpulan"); 
						this.adjustColumn("score_id");
					},
				},
				{
					"css": "webix_dark",
					"view": "toolbar",
					"cols": [
						{ "view": "label", "label": "Bukti Penilaian" },
						{ "view": "button", "label": "Tambah Bukti Penilaian", "autowidth": true }
					]
				},
				{
					"url": "",
					"columns": [
						{ "id": "evaluasi_id", "header": "Evaluasi", "fillspace": false, "sort": "string", "hidden": false },
						{ "id": "penilaian_id", "header": "Bukti Penilaian", "sort": "string", "fillspace": true, "hidden": false },
						{ "id": "keterangan", "header": "Keterangan", "sort": "string", "fillspace": true, "hidden": false },
						{ "id": "file", "header": "Dokumen", "sort": "string", "fillspace": false, "hidden": false },
						{ "id": "tgl", "header": "Tanggal", "sort": "string", "fillspace": false, "hidden": false }
					],
					"view": "datatable"
				}
			],
			"type": "clean"
		}
	}
    urlChange(view, url){
        var id = url[0].params.id;
		$$("form_perusahaan").load(routeUrl+"/perusahaan/show/"+id);
		$$("tbl_penilaian").load(routeUrl+"evaluasi/show/"+id);
    }
}