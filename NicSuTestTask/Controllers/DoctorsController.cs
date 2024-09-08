using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using NicSuTestTask.Data;
using NicSuTestTask.Entities;
using System.Collections.Generic;
using System.ComponentModel;

namespace NicSuTestTask.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class DoctorsController : Controller
    {
        private readonly NicSuTestTaskContext _context;

        public DoctorsController(NicSuTestTaskContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> Index(int pageSize = 10, int pageNumber = 1, string orderBy = "FullName", bool desc = false)
        {
            Microsoft.Data.SqlClient.SqlParameter[] parameters =
            {
                new Microsoft.Data.SqlClient.SqlParameter("@pageSize", pageSize),
                new Microsoft.Data.SqlClient.SqlParameter("@pageNumber", pageNumber),
                new Microsoft.Data.SqlClient.SqlParameter("@orderBy", orderBy),
                new Microsoft.Data.SqlClient.SqlParameter("@desc", desc)
            };

            var doctorsOverview = await _context.DoctorOverviews.FromSqlRaw("GetDoctorsOverview", parameters).ToListAsync();
            return View(doctorsOverview);
        }

        [HttpGet]
        [Route("{id}")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var doctor = await _context.Doctors
                .FirstOrDefaultAsync(m => m.Id == id);

            if (doctor == null)
            {
                return NotFound();
            }

            return View(doctor);
        }

        [HttpPost]
        public async Task<IActionResult> Create([Bind("FullName,RoomId,SpecialtyId,PrecinctId")] Doctor doctor)
        {
            if (ModelState.IsValid)
            {
                _context.Add(doctor);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            return View(doctor);
        }

        //[HttpGet]
        //[Route("edit/{id}")]
        //public async Task<IActionResult> Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return NotFound();
        //    }

        //    var doctor = await _context.Doctors.FindAsync(id);

        //    if (doctor == null)
        //    {
        //        return NotFound();
        //    }

        //    return View(doctor);
        //}

        [HttpPatch]
        [Route("{id}")]
        public async Task<IActionResult> Edit(int id, [Bind("Id,FullName,RoomId,SpecialtyId,PrecinctId")] Doctor doctor)
        {
            if (id != doctor.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(doctor);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!DoctorExists(doctor.Id.Value))
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

            return View(doctor);
        }

        [HttpDelete]
        [Route("{id}")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var doctor = await _context.Doctors.FindAsync(id);

            if (doctor != null)
            {
                _context.Doctors.Remove(doctor);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool DoctorExists(int id)
        {
            return _context.Doctors.Any(e => e.Id == id);
        }
    }
}
