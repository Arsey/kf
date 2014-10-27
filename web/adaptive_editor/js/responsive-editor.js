/*jslint vars: true, plusplus: true, devel: true, nomen: true, indent: 4, maxerr: 50 */
/*global define, Sortable, window, CKEDITOR */

/*
    API
    
    #################################
    
    Create new editor instance:    
    
    <div id="holder"></div>
    
    <script>
        var new_editor = new ResponsiveEditor(document.getElementById('holder'));
    </script>
    
    ################################  
    
    Get serialized data, NOT prepared to save in DB:
    
    as STRING
    var data = new_editor.serialize();
    
    as JSON
    var data = new_editor.serialize(true);
    
    ################################
    
    Build editor from serialized data:
    
    var data = new_editor.serialize();
    new_editor.buildFromSerialized(data);
    
    ################################
    

    
    Render to html:
    
    new_editor.renderTo(document.getElementById('target'));
    
    ################################


*/
CKEDITOR.stylesSet.add( 'my_custom_style', [
    // Inline styles.
    { name: 'button', element: 'span', attributes: { 'class': 'button' } },
    { name: 'note text', element: 'p', attributes: { 'class': 'note-text' } },
    { name: 'text priority', element: 'p', attributes: { 'class': 'priority-block' } },
    { name: 'marker black', element: 'ul', attributes: { 'class': 'black-marker' } }
]);


(function (window) {
    "use strict";

    var ResponsiveEditor = function (el, data) {

        //init editor
        this.initEditor(el);
        this.initHandlers();
        if (data) {
            this.buildFromSerialized(data);
        } else {
            this.createRow();
        }
    };
 
    ResponsiveEditor.prototype = {
        initEditor: function (holder) {
            this.colMinSize = 1;
            this.colNumber = 12;
            this.currentBreakpoint = 'large';
            this.frame = document.createElement('iframe');
            
            holder.appendChild(this.frame);
            this.body =  this.frame.contentWindow.document.body;
            
            this.frame.style.width = "100%";
            this.frame.style.border = "none";
            this.body.style.height = 'auto';
            this.body.innerHTML = '<div id="editor" class="responsive-editor break-' + this.currentBreakpoint + '"><div class="row-add"></div></div><link rel="stylesheet" href="' + ResponsiveEditor.cssPath + '">';
            this.el = this.body.firstChild;
            
           
            
            //init rows;
            this.rows = new Sortable(this.el, {
                group: "rows",
                handle: ".row-handle",
                draggable: ".editor-row",
                ghostClass: "sortable-ghost"
            });
            this.adjustEditorSize();
        },
        adjustEditorSize: function () {
            this.frame.style.height = (Math.max(200, this.el.scrollHeight) + 50) + 'px';
        },
        initHandlers: function () {
            //  add listners
            this.el.addEventListener('click', function (event) {
                //add Row;
                var col, row;
                if (event.target.classList.contains('row-add')) {
                    this.createRow();
                }
                // remove Row;
                if (event.target.classList.contains('row-remove')) {
                    row = event.target.parentElement;
                    row.parentElement.removeChild(row);

                }
                
                // toggle visibility
                if (event.target.classList.contains('column-hide')){
                    this.toggleVisibilityState(event);
                }
                // add Col;
                if (event.target.classList.contains('column-add')) {
                   
                    if (this.checkEqualColumns(event.target.parentElement)) { //create equal columns
                        event.target.parentElement.insertBefore(this.createCol(), event.target);
                        this.justifyColumns(event.target.parentElement);
                    } else { //create simple column
                        event.target.parentElement.insertBefore(this.createCol({
                            small: this.colMinSize,
                            medium: this.colMinSize,
                            large: this.colMinSize,
                            content: '<p></p>'
                        }), event.target);
                    }
                }
                // remove Col;
                if (event.target.classList.contains('column-remove')) {
                    col = event.target.parentElement;
                    row = col.parentElement;
                    if (col.parentElement.querySelectorAll('.editor-column').length === 1) { //last column - remove row
                        row.parentElement.removeChild(row);
                    } else {
                        if (this.checkEqualColumns(row)) { //remove equal columns
                            row.removeChild(col);
                            this.justifyColumns(row);
                        } else { // simple remove column
                            row.removeChild(col);
                        }
                    }
                }
                
            }.bind(this), false);

            //column resize
            this.el.addEventListener('mousedown', this.resizeColumn.bind(this), false);

        },
        createCol: function (_data) {
            var col = document.createElement('div'),
                colContent = document.createElement('div'),
                colHandle = document.createElement('div'),
                colRemove = document.createElement('div'),
                colResize = document.createElement('div'),
                colHide = document.createElement('div'),
                data = _data || {
                    size: this.colMinSize,
                    content: '<p></p>'
                };
            col.className = 'editor-column';
            col.dataset.large = data.large || 12;
            col.dataset.medium = data.medium || 12;
            col.dataset.small = data.small || 12;
            
            colHide.className = "column-hide";
            col.dataset.hideLarge = data.hideLarge || 0;
            col.dataset.hideMedium = data.hideMedium || 0;
            col.dataset.hideSmall = data.hideSmall || 0;
            var correctName = this.currentBreakpoint[0].toUpperCase()+this.currentBreakpoint.substr(1);
            if (parseInt(data['hide'+correctName])){
                colHide.classList.add('active')   ;
            }
            

            colContent.className = 'column-content';
            colContent.setAttribute('contenteditable', 'true');
            colContent.innerHTML = data.content;
            
            CKEDITOR.inline(colContent, {stylesSet: 'my_custom_style'});
            col.addEventListener('dragend', function () {
                this.removeAttribute('draggable');
            }, false);

            colHandle.className = 'column-handle';
            colRemove.className = 'column-remove';
            colResize.className = 'column-resize';

            col.appendChild(colHandle);
            col.appendChild(colContent);
            col.appendChild(colResize);
            col.appendChild(colRemove);
            col.appendChild(colHide);
            this.adjustEditorSize();
            return col;
        },
        initColumns: function (row) {
            return new Sortable(row, {
                group: 'column',
                handle: '.column-handle',
                draggable: ".editor-column",
                ghostClass: "sortable-ghost"

            });
        },
        createRow: function (data) {
            var row = document.createElement('div'),
                rowHandle = document.createElement('div'),
                rowAdd = document.createElement('div'),
                rowRemove = document.createElement('div'),
                rowCollapse = document.createElement('input'),
                rowStyle = document.createElement('div'),
                rowClass = document.createElement('div');
            
            rowStyle.innerHTML = '<label>Style</label><input class="row-style">';
            rowClass.innerHTML = '<label>Class</label><input class="row-class">';
            rowStyle.className = 'row-class-holder';
            rowClass.className = 'row-style-holder';
            
            row.className = 'editor-row';
            rowHandle.className = 'row-handle';
            rowAdd.className = 'column-add';
            rowRemove.className = 'row-remove';
            
            var styleInput = rowStyle.querySelector('.row-style');
            styleInput.addEventListener('keyup', function (event) {
                row.setAttribute('style',event.target.value);
            }, false);
            
            var classInput = rowClass.querySelector('.row-class');
            classInput.addEventListener('keyup', function (event) {
                row.setAttribute('class', 'editor-row'+ ' ' + event.target.value);
            }, false);
            
            

            rowCollapse.setAttribute('type', 'checkbox');
            rowCollapse.value = 1;
            
            if (data) {
                if(data.collapsed){
                    rowCollapse.setAttribute('checked', 'checked');
                }
                if(data.class && data.class !== 'undefined'){
                    rowClass.querySelector('.row-class').value = data.class;
                    row.classList.add(data.class);
                }
                if(data.style && data.style !== 'undefined'){
                    rowStyle.querySelector('.row-style').value = data.style;
                    row.setAttribute('style', data.style);
                }
            }
            row.appendChild(rowCollapse);
            row.appendChild(rowHandle);
            if (data) { //build few columns from JSON
                [].forEach.call(data.columns, function (column) {
                    row.appendChild(this.createCol(column));
                }.bind(this));
            } else { //build new column
                row.appendChild(this.createCol());
            }
            row.appendChild(rowAdd);
            row.appendChild(rowRemove);
            
            row.appendChild(rowStyle);
            row.appendChild(rowClass);
            
            

            this.initColumns(row);
            this.el.insertBefore(row, this.el.getElementsByClassName('row-add')[0]);
            this.adjustEditorSize();
        },
        serialize: function (json) {
            var contentSerialized = [];
            [].forEach.call(this.el.querySelectorAll('.editor-row'), function (row) {
                var rowSerialized = {
                    collapsed: row.querySelector('input').checked,
                    class: row.querySelector('.row-class').value,
                    style: row.querySelector('.row-style').value,
                    columns: []
                };
                [].forEach.call(row.querySelectorAll('.editor-column'), function (col) {
                    var columnSerialized = {
                        content: col.getElementsByClassName('column-content')[0].innerHTML,
                        large: col.dataset.large || 1,
                        medium: col.dataset.medium || col.dataset.large || 1,
                        small: col.dataset.small || col.dataset.medium || col.dataset.large || 1,
                        hideSmall: col.dataset.hideSmall||0,
                        hideMedium: col.dataset.hideMedium||0,
                        hideLarge: col.dataset.hideLarge||0
                    };
                    rowSerialized.columns.push(columnSerialized);
                });
                contentSerialized.push(rowSerialized);
            });
            if (json) {
                return contentSerialized;
            } else {
                return JSON.stringify(contentSerialized);
            }
        },
        buildFromSerialized: function (data) {
            [].forEach.call(JSON.parse(data), function (row) {
                this.createRow(row);
            }.bind(this));
        },
        changeBreakpoint: function (breakpoint) {
            this.currentBreakpoint = breakpoint;
//            this.currentBreakpointIndex = ['small','medium','large'].indexOf(breakpoint);
            this.el.classList.remove('break-small', 'break-medium', 'break-large');
            this.el.classList.add('break-' + breakpoint);
            var correctName = this.currentBreakpoint[0].toUpperCase()+this.currentBreakpoint.substr(1);
            Array.prototype.forEach.call(this.el.querySelectorAll('.editor-column'), function (el,index) {
                var currentState = el.dataset['hide'+correctName];
                if (parseInt(currentState)) {
                    el.querySelector('.column-hide').classList.add('active');
                } else {
                    el.querySelector('.column-hide').classList.remove('active');
                }
            });
        },
        toggleVisibilityState: function (event) {
            event.target.classList.toggle('active');
            var parent = event.target.parentElement;
            var correctName = this.currentBreakpoint[0].toUpperCase()+this.currentBreakpoint.substr(1);
            var currentState = parent.dataset['hide'+correctName];
            parent.dataset['hide'+correctName] = parseInt(currentState)?0:1;
        },
        resizeColumn: function (event) {
            // resize target;
            var target = event.target.parentElement;
            if (event.target.classList.contains('column-content')) {
                //event.preventDefault();
                event.stopImmediatePropagation();
            }
            if (event.target.classList.contains('column-resize')) {
                var startPoint = event.clientX,
                    step = this.el.querySelector('.editor-row').clientWidth / 12,
                    startWidth = Number(target.dataset[this.currentBreakpoint] || 1),
                    rigthSide = target.getClientRects()[0].right,
                    resizer = function (event) {
                        //return with limited to inverted size of targetso it can't be scaled in negaivesize.
                        //Set step to 50px
                        var additinalSize = Math.max(startWidth * -1, Math.round((event.clientX - rigthSide) / step));
                        target.dataset[this.currentBreakpoint] = Math.max(1, startWidth + additinalSize);

                    }.bind(this),
                    stopResizer = function (event) {
                        this.el.removeEventListener('mousemove', resizer, false);
                        this.el.removeEventListener('mousemove', stopResizer, false);
                    }.bind(this);
                this.el.addEventListener('mousemove', resizer, false);
                this.el.addEventListener('mouseup', stopResizer, false);
                event.stopImmediatePropagation();
                event.preventDefault();
            }
            this.adjustEditorSize();
        },
        checkEqualColumns: function (row) {
            var columns = row.querySelectorAll('.editor-column');
            return [].every.call(columns, function (el) {
                return el.dataset.large == el.dataset.medium &&
                    el.dataset.medium == el.dataset.small &&
                    el.dataset.small == Math.round(this.colNumber / columns.length);
            }, this);
        },
        justifyColumns: function (row) {
            var columns = row.querySelectorAll('.editor-column');
            [].forEach.call(columns, function (el) {
                el.dataset.large = el.dataset.medium = el.dataset.small = Math.round(this.colNumber / columns.length);
            }, this);
        },
        renderTo: function (target,typeElem) {
            var html = '';
            [].forEach.call(this.serialize(true), function (row) {
                html += '<div class="row ' + ((row.collapsed) ? 'collapse' : '') + ' ' + row.class + '" '+(row.style?'style="'+row.style+'"':'')+'>';
                [].forEach.call(row.columns, function (column) {
                    html += '<div class="columns' 
                        + ((column.large) ? ' large-' + column.large : '') 
                        + ((column.medium) ? ' medium-' + column.medium : '') 
                        + ((column.small) ? ' small-' + column.small : '') 
                    
                        + ((~~column.hideLarge) ? ' hide-for-large' : '') 
                        + ((~~column.hideMedium) ? ' hide-for-medium' : '') 
                        + ((~~column.hideSmall) ? ' hide-for-small'  : '') 
                    
                    + '">';
                    html += column.content;
                    html += '</div>';
                }.bind(this));
                html += '</div>';
            }.bind(this));
            if(typeElem == 'input'){
            	target.val(html);
            }else{
            	target.innerHTML = html;
            }
        }
    };
    window.ResponsiveEditor = ResponsiveEditor;

}(window));






