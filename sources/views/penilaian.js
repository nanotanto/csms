import {JetView} from "webix-jet";

var savePenilaian = webix.proxy("rest", "http://localhost:8000/penilaian/save", {
    meta: "csrf_field()", //some param
    save:function(view, params){
        params.data.meta = this.meta;
        return webix.proxy.rest.save.call(this, view, params);
    }
});

var saveBukti = webix.proxy("rest", "http://localhost:8000/bukti/save", {
    meta: "csrf_field()", //some param
    save:function(view, params){
        params.data.meta = this.meta;
        return webix.proxy.rest.save.call(this, view, params);
    }
});

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
								{ name:"id","view": "text", hidden:true},
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
						{ id:"btn_tambah_nilai","view": "button", "label": "Tambah Penilaian Elemen", "autowidth": true, click:function(){ 
							var _id = $$('tbl_penilaian_all').getLastId();
							var perusahaan_id = $$('form_perusahaan').getValues().id;
						
							if ( _id === undefined) {
								var data = { id:1, perusahaan_id:perusahaan_id }
							} else {
								var data = { id:_id+1, perusahaan_id:perusahaan_id } 
							}

							$$('tbl_penilaian').editStop();
							var id = $$('tbl_penilaian').add(data, 0);
							$$("tbl_penilaian_all").load("http://localhost:8000/penilaian_baru"); 
							//$$('tbl_penilaian').editRow(id);   
							$$('tbl_penilaian').editCell(id, "subelemen_id", true, true);
						} }
					]
				},
				{
					"id": "tbl_penilaian",
					"columns": [
						{id:"id", hidden:true},
						{ "id": "perusahaan_id", "header": "Nama Perusahaan", "fillspace": false, "sort": "string", "hidden": true },
						{ "id": "subelemen_id", "header": "Elemen", "sort": "string", "fillspace": false, "hidden": false, editor:"text" },
						{ "id": "tgl_masuk", "header": "Tgl Masuk", "sort": "string", "fillspace": false, "hidden": false, editor:"date" },
						{ "id": "tgl_target", "header": "Tgl Target", "sort": "string", "fillspace": false, "hidden": false, editor:"date" },
						{ "id": "tgl_selesai", "header": "Tgl Selesai", "sort": "string", "fillspace": false, "hidden": false, editor:"date" },
						{ "id": "kesimpulan", "header": "Kesimpulan", "sort": "string", "fillspace": true, "hidden": false, editor:"text" },
						{ "id": "nilai_id", "header": "Nilai", "width": 50, "fillspace": false, "hidden": false, editor:"text" },
						{ header:"", template:"{common.trashIcon()}", width:40}
					],
					"view": "datatable",
					select:true,
                    editable:true,
                	editaction:"dblclick",
                    save: savePenilaian,
                    onClick:{
                        "wxi-trash":function(event, id, node){
                            webix.confirm("Anda yakin akan menghapus data ?").then(function(result){
                            webix.ajax().post("http://localhost:8000/penilaian/delete/"+id).then(() => webix.message("Data dihapus"));
							$$("tbl_penilaian").remove(id);							
							$$("tbl_penilaian_all").load("http://localhost:8000/penilaian_baru");
                            });
                        }
                    },
                    on:{
                        "onAfterSelect":function(id){
                        	$$("btn_add_bukti").enable();     
                        	$$("tbl_bukti").clearAll();                         
                            $$("tbl_bukti").load("http://localhost:8000/bukti/show/"+id);                                             
                            
                        }
                    }
				},

				{
					id:'tbl_penilaian_all',
					"view": "datatable",
					columns:[{id:"id"}],
					hidden:true,
				},

				{
					"css": "webix_dark",
					"view": "toolbar",
					"cols": [
						{ "view": "label", "label": "Bukti Penilaian" },
						{ id:"btn_add_bukti","view": "button", "label": "Tambah Bukti Penilaian", "autowidth": true, disabled:true, click:function(){ 
							var _idBukti = $$('tbl_bukti_all').getLastId();

							var Select_nilai = $$("tbl_penilaian").getSelectedItem();
							var penilaian_id = Select_nilai['id'];
						
							if ( _idBukti === undefined) {
								var data = { id:1, penilaian_id:penilaian_id }
							} else {
								var data = { id:_idBukti+1, penilaian_id:penilaian_id } 
							}

							$$('tbl_bukti').editStop();
							var id = $$('tbl_bukti').add(data, 0);
							$$("tbl_bukti_all").load("http://localhost:8000/bukti_baru"); 
							//$$('tbl_penilaian').editRow(id);   
							$$('tbl_bukti').editCell(id, "sub_subelemen_id", true, true);
						} }
					]
				},
				{
					"id": "tbl_bukti",
					"columns": [
						{ id:"id", hidden:true},
						{ "id": "penilaian_id", "header": "Evaluasi", "sort": "string", "fillspace": true, "hidden": true, editor:"text" },
						{ "id": "sub_subelemen_id", "header": "Bukti Penilaian", "fillspace": false, "sort": "string", "hidden": false, editor:"text" },
						{ "id": "keterangan", "header": "Keterangan", "sort": "string", "fillspace": true, "hidden": false, editor:"text" },
						{ "id": "file", "header": "Dokumen", "sort": "string", "fillspace": false, "hidden": false, editor:"text" },
						{ "id": "tgl", "header": "Tanggal", "sort": "string", "fillspace": false, "hidden": false, editor:"date" },
						{ header:"", template:"{common.trashIcon()}", width:40}
					],
					"view": "datatable",
					select:true,
                    editable:true,
                	editaction:"dblclick",
                    save: saveBukti,
                    onClick:{
                        "wxi-trash":function(event, id, node){
                            webix.confirm("Anda yakin akan menghapus data ?").then(function(result){
                            webix.ajax().post("http://localhost:8000/bukti/delete/"+id).then(() => webix.message("Data dihapus"));
							$$("tbl_bukti").remove(id);
							$$("tbl_bukti_all").load("http://localhost:8000/bukti_baru");
                            });
                        }
                    },
				},

				{
					id:'tbl_bukti_all',
					"view": "datatable",
					columns:[{id:"id"}],
					hidden:true,
				},

			],
			"type": "clean"
		}
	}
    urlChange(view, url){
        var id = url[0].params.id;
        $$("form_perusahaan").load("http://localhost:8000/perusahaan/show/"+id);
        $$("tbl_penilaian").load("http://localhost:8000/penilaian/show/"+id);
        $$("tbl_penilaian_all").load("http://localhost:8000/penilaian_baru");
        $$("tbl_bukti_all").load("http://localhost:8000/bukti_baru");
    }
}