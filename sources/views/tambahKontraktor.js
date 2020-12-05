import {JetView} from "webix-jet";

export default class TambahKontraktorView extends JetView{
	config(){
		return {
			"rows": [
				{
					"css": "webix_dark",
					"view": "toolbar",
					"cols": [
						{ "view": "label", "label": "Tambah Kontraktor Baru" }
					]
				},
				{ "autoheight": false, "view": "form", "type": "wide", "elementsConfig": { "required": false, "labelPosition": "top" },
					"rows": [
						{ "view": "text", "label": "Nama Perusahaan", "name": "name", "id": 1607174370560 },
						{ "view": "text", "label": "Alamat", "name": "email", "id": 1607174370561 },
						{ "label": "Telepon/ Fax", "view": "text", "id": 1607174370562 },
						{ "view": "button", "css": "webix_primary", "label": "Save", "id": 1607174370563 }
					],
					"id": 1607174370559
				}
			],
			"id": 1607174370558
		}
	}
}