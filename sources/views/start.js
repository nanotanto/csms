import {JetView} from "webix-jet";

export default class StartView extends JetView{
	config(){
		return {
			rows:[
				{ type:"header", template:"Dashboard"},
				/*wjet::Settings*/
				{
					"id": 1606861256857,
					"rows": [
						{
							"cols": [
								{
									"width": 250,
									"rows": [
										{
											"rows": [
												{ "type": "header", "template": "Tanggal masuk dokumen", "view": "template", "id": 1606814393020 },
												{ "url": "demo->5fc5b16624ab0800183ec60a", "view": "list", "id": 1606814393021 }
											],
											"id": 1606814393019,
											"height": 150
										},
										{
											"rows": [
												{ "type": "header", "template": "Nama Perusahaan", "view": "template", "id": 1606814393023 },
												{ "url": "demo->5fc5b1f324ab0800183ec62b", "view": "list", "id": 1606814393024 }
											],
											"id": 1606814393022
										},
										{
											"rows": [
												{ "type": "header", "template": "Bagian atau Elemen", "view": "template", "id": 1606814393026 },
												{ "url": "demo->5fc5b26524ab0800183ec641", "view": "list", "id": 1606814393027 }
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
									"rows": [
										{
											"type": "wide",
											"cols": [
												{
													"rows": [
														{
															"view": "template",
															"template": "<span class='webix_icon wxi-search'></span> PENILAIAN PRAKUALIFIKASI",
															"type": "header",
															"id": 1606814393037
														},
														{
															"cols": [
																{
																	"rows": [
																		{
																			view:"justgage-chart",
																			value:50,
																			id:"gage1",
																			label:"%",
																			levelColors:[ "#ff0000", "#f9c802", "#a9d70b" ]
																		},
																		{
																			"css": "webix_dark",
																			"view": "toolbar",
																			"cols": [
																				{ "view": "label", "label": "TOTAL ELEMEN", "align": "center", "id": 1606814393042 }
																			],
																			"id": 1606814393041
																		},
																		{
																			"view": "template",
																			"template": "<center><H1>45</H1><c/enter>",
																			"role": "placeholder",
																			"height": 90,
																			"id": 1606814393043
																		}
																	],
																	"id": 1606814393039
																},
																{
																	"rows": [
																		{
																			"view": "template",
																			"template": "<center><H3>KLASIFIKASI PENGADAAN</H3><c/enter><center><H1>SEDANG</H1><c/enter>",
																			"id": 1606814393045
																		},
																		{
																			"css": "webix_dark",
																			"view": "toolbar",
																			"cols": [
																				{ "view": "label", "label": "TOTAL SUB ELEMENT", "align": "center", "id": 1606814393047 }
																			],
																			"id": 1606814393046
																		},
																		{ "view": "template", "template": "<center><H1>31</H1><c/enter>", "height": 90, "id": 1606814393048 }
																	],
																	"id": 1606814393044
																}
															],
															"id": 1606814393038
														}
													],
													"id": 1606814393036
												},
												{
													"rows": [
														{
															"view": "template",
															"template": "<span class='webix_icon wxi-search'></span> ELEMEN WAJIB MEMILIKI NILAI 'C' atau 6",
															"type": "header",
															"id": 1606814393050
														},
														{
															"url": "demo->5fc60a1924ab0800183ed92d",
															"columns": [
																{ "id": "elemen", "header": "Elemen", "fillspace": true, "sort": "string", "hidden": false },
																{
																	"id": "nilai",
																	"header": "Nilai",
																	"sort": "string",
																	"width": 50,
																	"fillspace": false,
																	"hidden": false
																}
															],
															"view": "datatable",
															"id": 1606814393051
														}
													],
													"id": 1606814393049
												}
											],
											"id": 1606814393035
										},
										{
											"type": "wide",
											"cols": [
												{
													"rows": [
														{
															"type": "header",
															"template": "<span class='webix_icon wxi-checkbox-marked'></span> NILAI DTL PER ELEMEN ",
															"view": "template",
															"id": 1606814393054
														},
														{
															"url": "demo->5fc5a3c024ab0800183ec2a8",
															"type": "barH",
															"xAxis": "#value#",
															"yAxis": {},
															"view": "chart",
															"item": { "shadow": true },
															"id": 1606814393055
														}
													],
													"id": 1606814393053
												},
												{
													"rows": [
														{
															"type": "header",
															"template": "<span class='webix_icon wxi-checkbox-marked'></span> TOTAL NILAI PER ELEMEN CSMS ",
															"view": "template",
															"id": 1606814393057
														},
														{
															"url": "demo->5fc5a3c024ab0800183ec2a8",
															"type": "bar",
															"xAxis": "#value#",
															"yAxis": {},
															"view": "chart",
															"id": 1606814393058
														}
													],
													"id": 1606814393056
												}
											],
											"id": 1606814393052
										}
									],
									"type": "wide",
									"id": 1606814393034
								},
								{
									"width": 250,
									"rows": [
										{
											"rows": [
												{ "type": "header", "template": "Tanggal masuk dokumen", "view": "template", "id": 1606814393061 },
												{ "url": "demo->5fc5d58224ab0800183ecb1c", "view": "list", "id": 1606814393062 }
											],
											"id": 1606814393060,
											"height": 250
										},
										{
											"rows": [
												{ "type": "header", "template": "Nomor Klausul CSMS", "view": "template", "id": 1606814393064 },
												{ "url": "demo->5fc5d5e924ab0800183ecb31", "view": "list", "id": 1606814393065 }
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
				}
			]
		}
	}
}