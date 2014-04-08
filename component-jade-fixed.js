var jade = require('jade');
var path = require('path');
var fs = require('fs');

module.exports = function (builder) {
	// NOTE :
	// This seems to work, but it very well might fail due to race conditions
	// Let's see what happens next ...

	builder.hook('before templates', function (pkg, next) {
		if (pkg.config.templates === undefined) {
			return next();
		}

		pkg.config.templates = pkg.config.templates.filter(function (file) {
			return path.extname(file) !== '.jade';
		});

		next();
	});

	builder.hook('before scripts', function (pkg, next) {
		if (pkg.config.templates === undefined) {
			return next();
		}

		var files = pkg.config.templates.filter(function(file) {
			return path.extname(file) === '.jade';
		});

		if (files.length === 0) {
			return next();
		}

		files.forEach(function (file) {
			var realpath = pkg.path(file);
			var str = fs.readFileSync(realpath, 'utf8');
			var compiled = "\
				var jade = require('visionmedia-jade/lib/runtime.js');\n\
				module.exports = " + jade.compileClient(str, { filename: file });
			var filename = file.replace('.jade', '.html');

			pkg.removeFile('templates', file);
			pkg.addFile('scripts', filename, compiled);
		});

		next();
	});
};