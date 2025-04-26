<?php

namespace App\Http\Controllers;


use Hash;
use Session;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    public function listByUser(User $user)
    {
        // Eager load orders + order details + product
        $user->load('orders.orderDetails.product');

        return view('order.order', compact('user'));
    }
    
}
