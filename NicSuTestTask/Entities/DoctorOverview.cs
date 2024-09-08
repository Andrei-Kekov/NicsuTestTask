namespace NicSuTestTask.Entities
{
    public class DoctorOverview
    {
        public int Id { get; set; }

        public string FullName { get; set; } = string.Empty;

        public string? RoomNumber { get; set; }

        public string? SpecialtyName { get; set; }

        public string? PrecinctNumber { get; set; }
    }
}
