/**
 * @license Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights
 *          reserved. For licensing, see LICENSE.html or
 *          http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function(config) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	config.uiColor = '#D8E7F6';

	filebrowserBrowseUrl = '/ckfinder/ckfinder.html';
	filebrowserImageBrowseUrl = '/ckfinder/ckfinder.html?type=Images';
	filebrowserFlashBrowseUrl = '/ckfinder/ckfinder.html?type=Flash';
	filebrowserUploadUrl = '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
	filebrowserImageUploadUrl = '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
	filebrowserFlashUploadUrl = '/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';
};
