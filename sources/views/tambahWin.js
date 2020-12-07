import { $$ } from "webix";
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
                    { "autoheight": false, "view": "form", "type": "wide", "elementsConfig": { "required": true, "labelPosition": "top" },
                        "rows": [
                            { name:"nama", "view": "text", "label": "Nama Perusahaan", validate:"isNotEmpty"},
                            { name:"alamat", "view": "text", "label": "Alamat", validate:"isNotEmpty"},
                            { name:"telepon", "label": "Telepon/ Fax", "view": "text", validate:"isNotEmpty"},
                            {
                                cols:[
                                    { id:"btn_simpan","view": "button", "css": "webix_primary", "label": "Simpan", click:function(){
                                                                                
                                        var form = this.getFormView();
                                        if (form.validate()){
                                            var data = form.getValues();
                                                webix.ajax().post("http://localhost:8000/perusahaan/save", data).then(() => webix.message("Kontraktor baru sudah di tambah"));

                                            form.clear();

                                        }                                    
                                        else
                                            webix.message({ type:"error", text:"Form data is invalid" });
                                    }},{gravity:1}
                                ]
                            }
                        ],
                        rules:{
                        "nama":webix.rules.isNotEmpty,
                        "alamat":webix.rules.isNotEmpty,
                        "telepon":webix.rules.isNotEmpty
                        },
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