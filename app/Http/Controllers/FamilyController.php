<?php

namespace App\Http\Controllers;

use App\Models\Family;
use App\Models\Member;
use Illuminate\Http\Request;

class FamilyController extends Controller
{
    public function index()
    {
        $families = Family::with('members')->get();
        $totalFamilies = Family::count();
        $totalGuests = Member::count();

        return view('dashboard', compact('families', 'totalFamilies', 'totalGuests'));
    }

    public function create()
    {
        return view('create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'members' => 'required|array',
            'members.*' => 'required|string|max:255'
        ]);

        $family = Family::create(['name' => $request->name]);

        foreach ($request->members as $member) {
            Member::create(['name' => $member, 'family_id' => $family->id]);
        }

        return redirect()->route('families.index')->with('success', 'Family and members registered successfully!');
    }

    public function edit($id)
    {
        $family = Family::with('members')->findOrFail($id);
        return view('edit', compact('family'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'members' => 'required|array',
            'members.*' => 'required|string|max:255',
        ]);

        $family = Family::findOrFail($id);
        $family->update(['name' => $request->name]);
        $family->members()->delete();

        foreach ($request->members as $member) {
            Member::create(['name' => $member, 'family_id' => $family->id]);
        }

        return redirect()->route('families.index')->with('success', 'Family and members updated successfully!');
    }

    public function delete($id)
    {
        $family = Family::findOrFail($id);
        return view('delete', compact('family'));
    }


    public function destroy($id)
    {
        $family = Family::findOrFail($id);
        $family->members()->delete();
        $family->delete();

        return redirect()->route('families.index')->with('success', 'Family and members deleted successfully!');
    }
}
