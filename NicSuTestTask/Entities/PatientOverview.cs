﻿namespace NicSuTestTask.Entities
{
    public class PatientOverview
    {
        public int Id { get; set; }

        public string? LastName { get; set; }

        public string? FirstName { get; set; }

        public string? Patronymic { get; set; }

        public string? Address { get; set; }

        public DateTime? DateOfBirth { get; set; }

        public string? Gender { get; set; }

        public string? PrecinctNumber { get; set; }
    }
}
