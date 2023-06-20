enum PickerFileType {
  image(['jpg', 'jpeg', 'png', 'webp', 'bmp', 'tif', 'hiec']),
  file(['pdf', 'docx', 'doc', 'txt', 'rtf', 'xls', 'xlsx', 'ppt', 'pptx']),
  audio(['mp3', 'weba', '3gp', '3g2', 'aac', 'mid', 'midi', 'wav']),
  video(['mp4', 'avi', '3gp', 'mpeg', 'ogv', '3g2']);

  const PickerFileType(this.extensions);

  final List<String> extensions;
}

enum SourceType {
  camera,
  gallery,
}
