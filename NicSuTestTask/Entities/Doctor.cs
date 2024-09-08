namespace NicSuTestTask.Entities
{
    public class Doctor
    {
        public int? Id { get; set; }

        public string FullName { get; set; } = string.Empty;

        public int? RoomId { get; set; }

        public int? SpecialtyId { get; set; }

        public int? PrecinctId { get; set; }
    }
}
