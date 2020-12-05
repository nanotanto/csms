import {JetView} from "webix-jet";

export default class TambahWinView extends JetView{
	config(){
		return {
            view:"popup",
            position:"center",
            width:500,
            height:250,
            body:{
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
                            {
                                "cols": [
                                    { "view": "spacer" },
                                    { "view": "button", "css": "webix_primary", "label": "Save", "id": 1607174370563 },
                                    { "view": "spacer" }
                                ]
                            }
                        ],
                        "id": 1607174370559
                    }
                ],
                "id": 1607174370558
            }
		}
    }
    showWindow(){
        this.getRoot().show();
    }
}