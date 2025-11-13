class ApiInfoDto {
  final String? projectName;
  final String? version;
  final String? projectLink;
  final String? organization;
  final String? organizationLink;
  final String? description;

  ApiInfoDto(
      {this.projectName,
      this.version,
      this.projectLink,
      this.organization,
      this.organizationLink,
      this.description});

  factory ApiInfoDto.fromJson(Map<String, dynamic> json) {
    return ApiInfoDto(
      projectName: json['project_name'],
      version: json['version'],
      projectLink: json['project_link'],
      organization: json['organization'],
      organizationLink: json['organization_link'],
      description: json['description'],
    );
  }
}
