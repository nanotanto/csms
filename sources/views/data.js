import {JetView} from "webix-jet";
//import {data} from "models/records";

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
							"url": "",
							"columns": [
								{ "id": "title", "header": "Title", "fillspace": true, "sort": "string" },
								{ "id": "year", "header": "Year", "sort": "string" },
								{ "id": "votes", "header": "Votes", "sort": "string" },
								{ "id": "rating", "header": "Rating", "sort": "string" },
								{ "id": "rank", "header": "Rank", "sort": "string" },
								{ "id": "category", "header": "Category", "sort": "string" }
							],
							"view": "datatable"
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
	}
}