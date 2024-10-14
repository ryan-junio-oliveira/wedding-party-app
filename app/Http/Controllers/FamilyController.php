<?php

namespace App\Http\Controllers;

use App\Models\Family;
use App\Models\Member;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;
use Symfony\Component\HttpFoundation\StreamedResponse;

class FamilyController extends Controller
{
    public function index()
    {
        $family = Family::with('members')->get();
        $totalfamily = Family::count();
        $totalGuests = Member::count();

        return view('dashboard', compact('family', 'totalfamily', 'totalGuests'));
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

        return redirect()->route('family.index')->with('success', 'Family and members registered successfully!');
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

        return redirect()->route('family.index')->with('success', 'Family and members updated successfully!');
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

        return redirect()->route('family.index')->with('success', 'Family and members deleted successfully!');
    }

    public function exportCsv()
    {
        $family = Family::with('members')->get();

        $headers = [
            "Content-type" => "text/csv",
            "Content-Disposition" => "attachment; filename=family.csv",
            "Pragma" => "no-cache",
            "Cache-Control" => "must-revalidate, post-check=0, pre-check=0",
            "Expires" => "0"
        ];

        $callback = function () use ($family) {
            $handle = fopen('php://output', 'w');
            fputcsv($handle, ['Family Name', 'Total Members']);

            foreach ($family as $family) {
                fputcsv($handle, [$family->name, $family->members->count()]);
            }

            fclose($handle);
        };

        return new StreamedResponse($callback, 200, $headers);
    }

    public function exportPdf()
    {
        $family = Family::with('members')->get();
        $totalfamily = Family::count();
        $totalGuests = Member::count();

        $pdf = Pdf::loadView('family', compact('family', 'totalfamily', 'totalGuests'));

        return $pdf->download('family.pdf');
    }
}
