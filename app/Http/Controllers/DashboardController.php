<?php

namespace App\Http\Controllers;

use App\Models\Family;
use App\Models\Member;

class DashboardController extends Controller
{
    public function index()
    {
        $family = Family::with('members')->get();   
        $totalfamily = $family->count();
        $totalGuests = Member::count();
        return view('dashboard', compact('family', 'totalfamily', 'totalGuests'));
    }
}
