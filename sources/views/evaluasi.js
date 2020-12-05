import {JetView} from "webix-jet";
import TambahWinView from "views/tambahWin"

export default class EvaluasiView extends JetView{
	config(){
		return {
			"rows": [
				{
					"css": "webix_dark",
					"view": "toolbar",
					"cols": [
						{ "view": "label", "label": "Evaluasi CSMS" },
						{ "view": "button", "label": "Tambah Kontraktor Baru", "autowidth": true,
							click:() => this.win.showWindow()
						}
					]
				},
				{
					"url": "",
					"columns": [
						{ "id": "name", "header": "Nama Perusahaan", "fillspace": true, "sort": "string", "hidden": false },
						{ "id": "alamat", "header": "Alamat", "sort": "string", "fillspace": true, "hidden": false },
						{ "id": "telepon", "header": "Telepon/ Fax", "sort": "string", "fillspace": false, "hidden": false }
					],
					"view": "datatable"
				},
				{
					"css": "webix_dark",
					"view": "toolbar",
					"height": 44,
					"cols": [
						{ "view": "label", "label": "" },
						{ "view": "button", "label": "Penilaian Elemen CSMS", "autowidth": true,
							click:()=>{
                                //var id = $$("tbl_kontraktor").getSelectedId();
								//this.app.show("/top/penilaian?id="+id);
								this.app.show("/top/penilaian?id=");
							}
						}
					]
				}
			]
		}
	}
    init(){
        this.win = this.ui(TambahWinView);
    }
}