<?php

namespace App\Http\Controllers;


use Hash;
use Session;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RoleController extends Controller
{
    public function role(Request $request) {
        $role_id = $request->get('id');
        $role = Role::with('users')->find($role_id); // Truy vấn cùng với users
    
        if (!$role) {
            abort(404); // Nếu không tìm thấy role, trả về lỗi 404
        }
    
        $data = [
            'role' => $role,
            'users' => $role->users // Lấy users liên quan đến role
        ];
    
        return view('role.view', $data);
    }
    
}
