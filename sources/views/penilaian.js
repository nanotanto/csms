import {JetView} from "webix-jet";

export default class EvaluasiView extends JetView{
	config(){
		return { autoheight:true,
			"rows": [ 
				{
					"css": "webix_dark",
					"view": "toolbar",
					"cols": [
						{ "view": "label", "label": "Evaluasi CSMS" },
						{ "icon": "wxi-close", "view": "icon", "height": 38, "width": 38,
							click:()=>{
								this.app.show("/top/evaluasi")
							}
						}
					]
				},
				{ "autoheight": true, "view": "form", "elementsConfig": { "required": false, "labelPosition": "top" },
					"rows": [
						{
							"cols": [
								{ "view": "text", "label": "Nama Perusahaan", "name": "name" },
								{ "label": "Alamat", "view": "text", "height": 0 },
								{ "label": "Telepon/ Fax", "view": "text", "height": 0 }
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
					"url": "",
					"columns": [
						{ "id": "perusahaan_id", "header": "Nama Perusahaan", "fillspace": false, "sort": "string", "hidden": false },
						{ "id": "subelemen_id", "header": "Elemen", "sort": "string", "fillspace": false, "hidden": false },
						{ "id": "tgl_masuk", "header": "Tgl Masuk", "sort": "string", "fillspace": false, "hidden": false },
						{ "id": "tgl_target", "header": "Tgl Target", "sort": "string", "fillspace": false, "hidden": false },
						{ "id": "tgl_selesai", "header": "Tgl Selesai", "sort": "string", "fillspace": false, "hidden": false },
						{ "id": "kesimpulan", "header": "Kesimpulan", "sort": "string", "fillspace": true, "hidden": false },
						{ "id": "nilai_id", "header": "Nilai", "width": 50, "fillspace": false, "hidden": false }
					],
					"view": "datatable"
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
}