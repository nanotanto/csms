<?php

namespace App\Http\Controllers;
use App\Bukti;
use Illuminate\Http\Request;

class BuktiController extends Controller
{
    public function index(){
        $data = Bukti::all();
        return response()->json($data);
    }
    
    public function indexNew(){
        $data = Bukti::orderBy('id','asc')->get();
        return response()->json($data);
    }

    public function show($id){
        $data = Bukti::where("penilaian_id",$id)->get();
        return response()->json($data);
    }

    public function save(Request $request)
    {
        Bukti::create($request->all());
    }

    public function update(Request $request, $id){
        $data = Bukti::findOrFail($id);
        $data->fill($request->all());

        if ($request->input("sub_subelemen_id") == "") {            
            $data->sub_subelemen_id = null;
        }else{
            $data->sub_subelemen_id = $request->input("sub_subelemen_id");
        }

        if ($request->input("tgl") == "") {            
            $data->tgl = null;
        }else{
            $data->tgl = $request->input("tgl");
        }

        $data->save();
    }

    public function delete(Request $request, $id){
        $data = Bukti::find($id);
        $data->delete();
    }
}
