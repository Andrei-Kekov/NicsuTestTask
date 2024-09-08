using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NicSuTestTask.Data;
using NicSuTestTask.Entities;

namespace NicSuTestTask.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PatientsController : Controller
    {
        private readonly NicSuTestTaskContext _context;

        public PatientsController(NicSuTestTaskContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> Index(int pageSize = 10, int pageNumber = 1, string orderBy = "LastName", bool desc = false)
        {
            Microsoft.Data.SqlClient.SqlParameter[] parameters =
            {
                new Microsoft.Data.SqlClient.SqlParameter("@pageSize", pageSize),
                new Microsoft.Data.SqlClient.SqlParameter("@pageNumber", pageNumber),
                new Microsoft.Data.SqlClient.SqlParameter("@orderBy", orderBy),
                new Microsoft.Data.SqlClient.SqlParameter("@desc", desc)
            };

            var patientsOverview = await _context.PatientOverviews.FromSqlRaw("GetPatientsOverview", parameters).ToListAsync();
            return View(patientsOverview);
        }

        [HttpGet]
        [Route("{id}")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var patient = await _context.Patients
                .FirstOrDefaultAsync(m => m.Id == id);

            if (patient == null)
            {
                return NotFound();
            }

            return View(patient);
        }

        [HttpPost]
        public async Task<IActionResult> Create([Bind("LastName,FirstName,Patronymic,Address,DateOfBirth,Gender,PrecinctId")] Patient patient)
        {
            if (ModelState.IsValid)
            {
                _context.Add(patient);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            return View(patient);
        }

        //public async Task<IActionResult> Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var patient = await _context.Patient.FindAsync(id);
        //    if (patient == null)
        //    {
        //        return NotFound();
        //    }
        //    return View(patient);
        //}

        [HttpPatch]
        [Route("{id}")]
        public async Task<IActionResult> Edit(int id, [Bind("Id,FirstName,LastName,Patronymic,Address,DateOfBirth,Gender,PrecinctId")] Patient patient)
        {
            if (id != patient.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(patient);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PatientExists(patient.Id.Value))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }

                return RedirectToAction(nameof(Index));
            }

            return View(patient);
        }

        //[HttpGet]
        //public async Task<IActionResult> Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var patient = await _context.Patient
        //        .FirstOrDefaultAsync(m => m.Id == id);

        //    if (patient == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(patient);
        //}

        [HttpDelete]
        [Route("{id}")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var patient = await _context.Patients.FindAsync(id);

            if (patient != null)
            {
                _context.Patients.Remove(patient);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PatientExists(int id)
        {
            return _context.Patients.Any(e => e.Id == id);
        }
    }
}
