<?php

namespace App\Http\Controllers;
use App\Penilaian;
use Illuminate\Http\Request;

class PenilaianController extends Controller
{
    public function index(){
        $data = Penilaian::all();
        return response()->json($data);
    }
    
    public function indexNew(){
        $data = Penilaian::orderBy('id','desc')->first();
        return response()->json($data);
    }

    public function show($id){
        $data = Penilaian::where("perusahaan_id",$id)->get();
        return response()->json($data);
    }

    public function save(Request $request)
    {
        Penilaian::create($request->all());
    }

    public function update(Request $request, $id){
        $data = Penilaian::findOrFail($id);
        $data->fill($request->all());

        if ($request->input("subelemen_id") == "") {            
            $data->subelemen_id = null;
        }else{
            $data->subelemen_id = $request->input("subelemen_id");
        }

        if ($request->input("nilai_id") == "") {            
            $data->nilai_id = null;
        }else{
            $data->nilai_id = $request->input("nilai_id");
        }

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

    public function delete(Request $request, $id){
        $data = Penilaian::find($id);
        $data->delete();
    }
}
