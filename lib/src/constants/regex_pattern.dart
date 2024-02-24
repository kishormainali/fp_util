import 'package:fp_util/src/extensions/string_extension.dart';

///{@template regex_pattern}
/// A class that contains all the regex RegExps
/// that are commonly used in the application.
/// {@endtemplate}
abstract class RegexPattern {
  /// {@macro regex_pattern}
  const RegexPattern._();

  /// Email RegExp
  ///
  /// Example: test@gmail.com
  static const String email =
      r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";

  /// Phone number RegExp
  ///
  /// Example: +1234567890
  static const String phone = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';

  /// Number RegExp
  ///
  /// Example: 123
  /// Example: 123.456
  static const String number = r'^(([1-9]*)|(([0-9]*)\.([0-9]*)))$';

  /// Escaped character RegExp
  ///
  /// Example: \t, \n, \r, \v, \f
  static const String escapedChar = r'[\t\n\r\v\f]';

  /// URL RegExp
  ///
  /// Example: https://www.google.com
  /// Example: http://www.google.com
  /// Example: www.google.com
  static const String url = r"^((((H|h)(T|t)|(F|f))(T|t)(P|p)((S|s)?))\://)?(www.|[a-zA-Z0-9].)[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,6}(\:[0-9]{1,5})*(/($|[a-zA-Z0-9\.\,\;\?\'\\\+&amp;%\$#\=~_\-@]+))*$";

  /// URI RegExp
  ///
  /// Example: https://www.google.com
  /// Example: http://www.google.com
  /// Example: www.google.com
  static const String uri = r"^(?!.*[?@!&`()*+,;=_\-~\]\[#$]{2})(?!.*[?@!&`()*+,;=_.\-~:?\[\]]$)(?!.*(\/\.|\.\/))(\w+:(\/\/)?)\S*$";

  /// UUID RegExp
  ///
  /// Example: 123e4567-e89b-12d3-a456-426614174000
  static const String uuid = r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$';

  /// Password RegExp
  ///
  /// Example: Abc123
  static const String password = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';

  /// Hex color RegExp
  ///
  /// Example: #123456
  static const String hexColor = r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$';

  /// IPv4 Address RegExp
  ///
  /// Example: 192.168.0.0
  static const String ipv4 = r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';

  /// IPv6 Address RegExp
  ///
  /// Example: 2001:0db8:85a3:0000:0000:8a2e:0370:7334
  static const String ipv6 = r'^([0-9a-fA-F]{1,4}:){7}([0-9a-fA-F]{1,4})$';

  /// MAC Address RegExp
  ///
  /// Example: 00:0a:95:9d:68:16
  static const String macAddress = r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$';

  /// Date RegExp
  ///
  /// Example: 2021-12-31
  static const String date = r'^\d{4}-\d{2}-\d{2}$';

  /// Time RegExp
  ///
  /// Example: 12:00:00
  static const String time = r'^\d{2}:\d{2}:\d{2}$';

  /// Date and Time RegExp
  ///
  /// Example: 2021-12-31 12:00:00
  static const String dateTime = r'^([a-zA-Z]{3,},? ?)?([0-9]{1,4}|[a-zA-Z]{3,})[ -\/\.,:]([0-9]{1,4}|[a-zA-Z]{3,})([ -\/\.,:] ?\w+)?([ T]\d{2}:\d{2}(:\d{2})?(\.\d{3,})?[zZ]?)?([aApP]\.?[mM])?$';

  /// Date and Time RegExp in UTC
  ///
  /// Example: 2021-12-31 T 12:00:00Z
  static const String dateTimeUTC = r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}(.\d{3,})?[zZ]?$';

  /// SHA1 regex
  ///
  /// Example: 2fd4e1c67a2d28fced849ee1bb76e7391b93eb12
  static String sha1 = r'^(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})$';

  /// SHA256 regex
  ///
  /// Example: 2fd4e1c67a2d28fced849ee1bb76e7391b93eb12
  static String sha256 = r'^([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}$';

  /// HTML Tag RegExp
  ///
  /// Example: <div>test</div>
  static const String htmlTag = r'<([a-z]+)([^<]+)*(?:>(.*)<\/\1>|\s+/>)';

  /// Image RegExp
  ///
  /// Example: test.jpg
  static const String image = r'.(jpg|jpeg|png|gif|bmp|webp)$';

  /// Video RegExp
  ///
  /// Example: test.mp4
  static const String video = r'.(mp4|avi|flv|wmv|mov|webm)$';

  /// Audio RegExp
  ///
  /// Example: test.mp3
  static const String audio = r'.(mp3|wav|ogg|flac|aac|wma)$';

  /// SVG RegExp
  ///
  /// Example: test.svg
  static const String svg = r'.svg$';

  /// PDF RegExp
  ///
  /// Example: test.pdf
  static const String pdf = r'.pdf$';

  /// Document RegExp
  ///
  /// Example: test.doc
  /// Example: test.docx
  static const String doc = r'.(doc|docx)$';

  /// Excel RegExp
  ///
  /// Example: test.xls
  static const String xls = r'.(xls|xlsx)$';

  /// PowerPoint RegExp
  ///
  /// Example: test.ppt
  static const String ppt = r'.(ppt|pptx)$';

  /// Text RegExp
  ///
  /// Example: test.txt
  /// Example: test.rtf
  static const String txt = r'.(txt|rtf)$';

  /// Archive RegExp
  ///
  /// Example: test.zip
  static const String archive = r'.(zip|rar|7z|tar|gz)$';

  /// XML RegExp
  ///
  /// Example: test.xml
  static const String xml = r'.xml$';

  /// JSON RegExp
  ///
  /// Example: test.json
  static const String json = r'.json$';

  /// CSV RegExp
  ///
  /// Example: test.csv
  static const String csv = r'.csv$';

  /// APK RegExp
  ///
  /// Example: test.apk
  static const String apk = r'.apk$';

  /// IPA  RegExp
  ///
  /// Example: test.ipa
  static const String ipa = r'.ipa$';

  /// App Bundle RegExp
  ///
  /// Example: test.aab
  static const String appBundle = r'.aab$';

  /// Social Security Number RegExp
  ///
  /// Example: 123-45-6789
  static const String ssn = r'^\d{3}-\d{2}-\d{4}$';

  /// Bank State Branch RegExp
  ///
  /// Example: 123-456
  static const String bsb = r'^\d{3}-\d{3}$';

  /// Australian Business Number RegExp
  ///
  /// Example: 12 345 678 901
  static const String abn = r'^\d{2}\s\d{3}\s\d{3}\s\d{3}$';

  /// Australian Company Number RegExp
  ///
  /// Example: 123 456 782
  static const String acn = r'^\d{9}$';

  /// Social Insurance Number RegExp
  ///
  /// Example: 123-456-782
  static const String sin = r'^\d{3}-\d{3}-\d{3}$';

  /// Tax File Number RegExp
  ///
  /// Example: 123-456-782
  static const String tfn = r'^\d{3}-\d{3}-\d{3}$';

  /// Vehicle Identification Number RegExp
  ///
  /// Example: 1HGCM82633A004352
  static const String vin = r'^[A-HJ-NPR-Z0-9]{17}$';

  /// Credit Card RegExp
  ///
  /// Example: 1234-5678-9012-3456
  static const String card = r'^\d{4}-\d{4}-\d{4}-\d{4}$';

  /// Expiry Date RegExp
  ///
  /// Example: 12/23
  static const String expiryDate = r'^\d{2}/\d{2}$';

  /// CVV RegExp
  ///
  /// Example: 123
  static const String cvv = r'^\d{3}$';

  /// Bitcoin Address RegExp
  ///
  /// Example: 1A1zP1eP5QGefi2DMPTfTL5SLmv7DivfNa
  static const String bitcoinAddress = r'^[13][a-km-zA-HJ-NP-Z1-9]{25,34}$';

  /// Ethereum Address RegExp
  ///
  /// Example: 0x5AEDA56215b167893e80B4fE645BA6d5Bab767DE
  static const String ethereumAddress = r'^0x[a-fA-F0-9]{40}$';

  /// Ripple Address RegExp
  ///
  /// Example: rLdinLq5CJfeg5kjpU2xMqVf7PjA9ZCv3
  static const String rippleAddress = r'^r[0-9a-zA-Z]{24,34}$';

  /// ISBN RegExp
  ///
  /// Example: 978-3-16-148410-0
  static const String isbn = r'^(?=(?:\D*\d){10}(?:(?:\D*\d){3})?$)[\d-]+$';

  /// International Mobile Equipment Identity RegExp
  ///
  /// Example: 12-345678-901234-5
  static const String imei = r'^\d{2}-\d{4}-\d{6}-\d{1}$';

  /// SWIFT Code RegExp
  ///
  /// Example: ABBYGB2LXXX
  static const String swiftCode = r'^[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?$';

  /// Sort Code RegExp
  ///
  /// Example: 12-34-56
  static const String sortCode = r'^\d{2}-\d{2}-\d{2}$';

  /// Brazilian Individual Taxpayer Registry RegExp
  ///
  /// Example: 123.456.789-09
  static const String cpf = r'^\d{3}\.\d{3}\.\d{3}-\d{2}$';

  /// International Bank Account Number RegExp
  ///
  /// Example: GB82 WEST 1234 5698 7654 32
  /// Example: GB82WEST12345698765432
  static const String iban = r'^[A-Z]{2}\d{2}[A-Z]{4}\d{7}([A-Z\d]{0,16})?$';

  /// MIME Type RegExp for Image
  ///
  /// Example: image/jpeg
  static const String mimeTypeImage = r'^image\/.*$';

  /// MIME Type RegExp for Video
  ///
  /// Example: video/mp4
  static const String mimeTypeVideo = r'^video\/.*$';

  /// MIME Type RegExp for Audio
  ///
  /// Example: audio/mp3
  static const String mimeTypeAudio = r'^audio\/.*$';

  /// MIME Type RegExp for PDF
  ///
  /// Example: application/pdf
  static const String mimeTypePdf = r'^application\/pdf$';

  /// MIME Type RegExp for Document
  ///
  /// Example: application/msword
  /// Example: application/vnd.openxmlformats-officedocument.wordprocessingml.document
  static const String mimeTypeDoc = r'^application\/(msword|application/vnd.openxmlformats-officedocument.wordprocessingml.document)$';

  /// MIME Type RegExp for Presentation
  ///
  /// Example: application/vnd.ms-powerpoint
  /// Example: application/vnd.openxmlformats-officedocument.presentationml.presentation
  static const String mimeTypePpt = r'^application\/(vnd.ms-powerpoint|vnd.openxmlformats-officedocument.presentationml.presentation)$';

  /// MIME Type RegExp for Excel
  ///
  /// Example: application/vnd.ms-excel
  /// Example: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
  static const String mimeTypeXls = r'^application\/(vnd.ms-excel|vnd.openxmlformats-officedocument.spreadsheetml.sheet)$';

  /// MIME Type RegExp for Text
  ///
  /// Example: application/rtf
  /// Example: text/plain
  static const String mimeTypeTxt = r'^(application\/rtf|text\/plain)$';

  /// MIME Type RegExp for XML
  ///
  /// Example: application/xml
  /// Example: text/xml
  static const String mimeTypeXml = r'^(application\/xml|text\/xml)$';

  /// MIME Type RegExp for SVG
  ///
  /// Example: image/svg+xml
  /// Example: image/svg
  static const String mimeTypeSvg = r'^image\/svg\+xml$';

  /// MIME Type RegExp for CSV
  ///
  /// Example: text/csv
  static const String mimeTypeCsv = r'^text\/(csv|comma-separated-values)$';

  /// MIME Type RegExp for JSON
  ///
  /// Example: application/json
  static const String mimeTypeJson = r'^application\/json$';

  /// MIME Type RegExp for APK
  ///
  /// Example: application/vnd.android.package-archive
  static const String mimeTypeApk = r'^application\/vnd.android.package-archive$';

  /// MIME Type RegExp for IPA
  ///
  /// Example: application/x-itunes-ipa
  static const String mimeTypeIpa = r'^application\/x-itunes-ipa$';

  /// MIME Type RegExp for Archive
  ///
  /// Example: application/zip
  /// Example: application/x-tar
  static const String mimeTypeArchive = r'^application\/(zip|x-tar|x-gzip|x-bzip2)$';
}

/// {@template regex_matcher}
/// Wrapper class for matching the input with the given pattern
/// {@endtemplate}
abstract class RegexMatcher {
  /// {@macro regex_matcher}
  const RegexMatcher._();

  /// Matches the input with the given pattern
  static bool match(String input, String pattern) {
    if (input.isBlank) return false;
    return RegExp(pattern).hasMatch(input);
  }

  /// matches the input with the given patterns
  static bool matchMultiple(String input, List<String> patterns) {
    if (input.isBlank) return false;
    for (var pattern in patterns) {
      if (RegExp(pattern).hasMatch(input)) return true;
    }
    return false;
  }

  /// Matches the input with the given pattern for the given file type
  static bool matchFile(String input, RegexFileType type) {
    return switch (type) {
      RegexFileType.image => matchMultiple(input, [RegexPattern.image, RegexPattern.mimeTypeImage]),
      RegexFileType.video => matchMultiple(input, [RegexPattern.video, RegexPattern.mimeTypeVideo]),
      RegexFileType.audio => matchMultiple(input, [RegexPattern.audio, RegexPattern.mimeTypeAudio]),
      RegexFileType.pdf => matchMultiple(input, [RegexPattern.pdf, RegexPattern.mimeTypePdf]),
      RegexFileType.doc => matchMultiple(input, [RegexPattern.doc, RegexPattern.mimeTypeDoc]),
      RegexFileType.ppt => matchMultiple(input, [RegexPattern.ppt, RegexPattern.mimeTypePpt]),
      RegexFileType.xls => matchMultiple(input, [RegexPattern.xls, RegexPattern.mimeTypeXls]),
      RegexFileType.txt => matchMultiple(input, [RegexPattern.txt, RegexPattern.mimeTypeTxt]),
      RegexFileType.xml => matchMultiple(input, [RegexPattern.xml, RegexPattern.mimeTypeXml]),
      RegexFileType.svg => matchMultiple(input, [RegexPattern.svg, RegexPattern.mimeTypeSvg]),
      RegexFileType.csv => matchMultiple(input, [RegexPattern.csv, RegexPattern.mimeTypeCsv]),
      RegexFileType.archive => matchMultiple(input, [RegexPattern.archive, RegexPattern.mimeTypeArchive]),
      RegexFileType.json => matchMultiple(input, [RegexPattern.json, RegexPattern.mimeTypeJson]),
      RegexFileType.apk => matchMultiple(input, [RegexPattern.apk, RegexPattern.mimeTypeApk]),
      RegexFileType.ipa => matchMultiple(input, [RegexPattern.ipa, RegexPattern.mimeTypeIpa]),
      RegexFileType.appBundle => matchMultiple(input, [RegexPattern.appBundle, RegexPattern.mimeTypeApk]),
    };
  }
}

enum RegexFileType {
  image,
  video,
  audio,
  pdf,
  doc,
  ppt,
  xls,
  txt,
  xml,
  svg,
  csv,
  archive,
  json,
  apk,
  ipa,
  appBundle,
}
