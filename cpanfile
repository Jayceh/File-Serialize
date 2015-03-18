requires "Class::Load" => "0";
requires "Exporter::Tiny" => "0";
requires "List::Util" => "1.41";
requires "Path::Tiny" => "0";
requires "feature" => "0";
requires "parent" => "0";
requires "perl" => "v5.16.0";
requires "strict" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "File::Spec" => "0";
  requires "IO::Handle" => "0";
  requires "IPC::Open3" => "0";
  requires "Test::Exception" => "0";
  requires "Test::More" => "0.88";
  requires "Test::Requires" => "0";
  requires "Test::Warnings" => "0";
  requires "utf8" => "0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};

on 'develop' => sub {
  requires "version" => "0.9901";
};
