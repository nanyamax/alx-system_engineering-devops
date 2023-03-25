PUPPET
Manages files, including their content, ownership, and permissions.

The file type can manage normal files, directories, and symlinks; the type should be specified in the ensure attribute.

File contents can be managed directly with the content attribute, or downloaded from a remote source using the source attribute; the latter can also be used to recursively serve directories (when the recurse attribute is set to true or local). On Windows, note that file contents are managed in binary mode; Puppet never automatically translates line endings.
