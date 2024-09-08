using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using NicSuTestTask.Entities;

namespace NicSuTestTask.Data
{
    public class NicSuTestTaskContext : DbContext
    {
        public NicSuTestTaskContext (DbContextOptions<NicSuTestTaskContext> options)
            : base(options)
        {
        }

        public DbSet<NicSuTestTask.Entities.Doctor> Doctors { get; set; } = default!;

        public DbSet<NicSuTestTask.Entities.DoctorOverview> DoctorOverviews { get; set; } = default!;

        public DbSet<NicSuTestTask.Entities.Patient> Patients { get; set; } = default!;

        public DbSet<NicSuTestTask.Entities.PatientOverview> PatientOverviews { get; set; } = default!;
    }
}
