import {JetView} from "webix-jet";

var routeUrl = window.location.protocol +"//"+ window.location.hostname+window.location.pathname;

export default class DataView extends JetView{
	config(){
		return {
			"id": 1606861256857,
			"rows": [
				{ type:"header", template:"Resume Data"},
				{
					"cols": [
						{
							"width": 250,
							"rows": [
								{
									"rows": [
										{ "type": "header", "template": "Tanggal masuk dokumen", "view": "template", "id": 1606814393020 },
										{ "url": "", "view": "list", "id": 1606814393021 }
									],
									"id": 1606814393019,
									"height": 150
								},
								{
									"rows": [
										{ "type": "header", "template": "Nama Perusahaan", "view": "template", "id": 1606814393023 },
										{ "url": "", "view": "list", "id": 1606814393024 }
									],
									"id": 1606814393022
								},
								{
									"rows": [
										{ "type": "header", "template": "Bagian atau Elemen", "view": "template", "id": 1606814393026 },
										{ "url": "", "view": "list", "id": 1606814393027 }
									],
									"id": 1606814393025,
									"height": 200
								},
								{
									"rows": [
										{ "type": "header", "template": "Risk Ranking Sisa", "view": "template", "id": 1606814393029 },
										{
											"css": "webix_dark",
											"view": "toolbar",
											"cols": [
												{ "label": "L", "view": "button", "height": 0, "id": 1606814393031, "css": "webix_primary" },
												{ "label": "M", "view": "button", "height": 0, "id": 1606814393032, "css": "webix_primary" },
												{ "label": "H", "view": "button", "height": 0, "id": 1606814393033, "css": "webix_primary" }
											],
											"id": 1606814393030
										}
									],
									"id": 1606814393028,
									"height": 85
								}
							],
							"type": "wide",
							"id": 1606814393018
						},
						{
							"id":"tbl_resume",
							scheme:{
								$init:function(row){
									row.elemen_id = (row.elemen || "") && row.elemen.penjelasan
									row.subelemen_id = (row.subelemen || "") && row.subelemen.bagian
									row.subelemen_id_name = (row.subelemen || "") && row.subelemen.penjelasan
									row.score_id = (row.score || "") && row.score.poin							
								}
							},
							"columns": [
								{ "id": "perusahaan_id", "header": "Nama Perusahaan", "fillspace": false, "sort": "string", "hidden": true },
								{ "id": "elemen_id", "header": "Elemen", "sort": "string", "fillspace": false, "hidden": false },
								{ "id": "subelemen_id", "header": "", "sort": "string", "fillspace": false, "hidden": false },
								{ "id": "subelemen_id_name", "header": "Sub Elemen", "sort": "string", "fillspace": false, "hidden": false },
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
							"width": 250,
							"rows": [
								{
									"rows": [
										{ "type": "header", "template": "Tanggal masuk dokumen", "view": "template", "id": 1606814393061 },
										{ "url": "", "view": "list", "id": 1606814393062 }
									],
									"id": 1606814393060,
									"height": 250
								},
								{
									"rows": [
										{ "type": "header", "template": "Nomor Klausul CSMS", "view": "template", "id": 1606814393064 },
										{ "url": "", "view": "list", "id": 1606814393065 }
									],
									"id": 1606814393063
								}
							],
							"type": "wide",
							"id": 1606814393059
						}
					],
					"type": "wide"
				}
			]
		};
	}
	init(view){
		//view.parse(data);
		$$("tbl_resume").load(routeUrl+"evaluasi");
	}
}