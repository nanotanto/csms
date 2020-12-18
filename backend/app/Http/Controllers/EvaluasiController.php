<?php

namespace App\Http\Controllers;
use App\Evaluasi;
use Illuminate\Http\Request;

class EvaluasiController extends Controller
{
    public function index(){
        $data = Evaluasi::with(['elemen','subelemen','score'])->get();
        return response()->json($data);
    }

    public function show($id){
        $data = Evaluasi::where("perusahaan_id",$id)->with(['elemen','subelemen','score'])->get();
        return response()->json($data);
    }

    public function save(Request $request)
    {
        //Evaluasi::create($request->all());

        $data = new Evaluasi();
        $data->fill($request->all());

        if ($request->input("tgl_masuk") == "") {            
            $data->tgl_masuk = null;
        }else{
            $data->tgl_masuk = $request->input("tgl_masuk");
        }

        if ($request->input("tgl_target") == "") {            
            $data->tgl_target = null;
        }else{
            $data->tgl_target = $request->input("tgl_target");
        }

        if ($request->input("tgl_selesai") == "") {            
            $data->tgl_selesai = null;
        }else{
            $data->tgl_selesai = $request->input("tgl_selesai");
        }

        $data->save();
    }

    public function update(Request $request, $id){
        $data = Evaluasi::findOrFail($id);
        $data->fill($request->all());

        if ($request->input("tgl_masuk") == "") {            
            $data->tgl_masuk = null;
        }else{
            $data->tgl_masuk = $request->input("tgl_masuk");
        }

        if ($request->input("tgl_target") == "") {            
            $data->tgl_target = null;
        }else{
            $data->tgl_target = $request->input("tgl_target");
        }

        if ($request->input("tgl_selesai") == "") {            
            $data->tgl_selesai = null;
        }else{
            $data->tgl_selesai = $request->input("tgl_selesai");
        }
        
        $data->save();
    }

    public function newData(){
        $data = Evaluasi::latest()->first();
        return response()->json($data);
    }

    public function delete(Request $request, $id){
        $data = Evaluasi::find($id);
        $data->delete();
    }
}
