import archiver from 'archiver';
import fs from 'fs';

const output = fs.createWriteStream('../deploy2.zip');
const archive = archiver('zip', { zlib: { level: 9 } });

output.on('close', function() {
  console.log(archive.pointer() + ' total bytes');
});

archive.pipe(output);

const files = fs.readFileSync('file_list2.txt', 'utf8')
  .split('\n')
  .map(s => s.trim())
  .filter(Boolean);

files.forEach(f => {
  if (fs.existsSync(f)) {
    archive.file(f, { name: f });
  } else {
    console.warn('File not found: ' + f);
  }
});

archive.finalize();
