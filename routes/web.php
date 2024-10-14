<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FamilyController;
use App\Http\Controllers\SupplierController;

// Rotas para gerenciamento de famílias
Route::get('/', [FamilyController::class, 'index'])->name('family.index');
Route::get('/family/create', [FamilyController::class, 'create'])->name('family.create');
Route::post('/family/store', [FamilyController::class, 'store'])->name('family.store');
Route::get('/family/{id}/delete', [FamilyController::class, 'delete'])->name('family.delete');
Route::delete('/family/{id}', [FamilyController::class, 'destroy'])->name('family.destroy');
Route::get('/family/{id}/edit', [FamilyController::class, 'edit'])->name('family.edit');
Route::put('/family/{id}', [FamilyController::class, 'update'])->name('family.update');
Route::get('/export-family', [FamilyController::class, 'exportCsv'])->name('family.export');
Route::get('/export-family-pdf', [FamilyController::class, 'exportPdf'])->name('family.export.pdf');

Route::get('/suppliers', [SupplierController::class, 'index'])->name('suppliers.index');
Route::get('/about', function() {
    return view('about'); // Certifique-se de ter uma view chamada 'about.blade.php'
})->name('about');
Route::get('/contact', function() {
    return view('contact'); // Certifique-se de ter uma view chamada 'contact.blade.php'
})->name('contact');

