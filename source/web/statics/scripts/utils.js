function submitForm(url) {
//    showWaiting();
    document.forms[0].action = url;
    document.forms[0].submit();
}

function submitAction(val) {
//    showWaiting();
    document.forms[0].act.value = val;
    document.forms[0].submit();
}

function submitLink(url) {
//    showWaiting();
    document.location = url;
}

function clickTopMenu(url) {
    $.ajax({
        url: APP_PATH + '/clickTopMenu',
        data: {'url': url},
        type: 'POST',
        success: function(res) {
            document.location = url;
        }
    });
}
function getLatestMessages() {
    $.ajax({
        url: APP_PATH + '/getLatestMessages',
        type: 'POST',
        success: function(res) {
            if (res.status == "SUCCESS") {
                $('#latestMessage').append(res.data.html);
            }
        }
    });
}
function initTopMenu(url) {
    if (url == null || url == '') {
        $('ul.navbar-nav a:first').parents('li:first').addClass('active');
        return;
    }

    $('ul.navbar-nav a').each(function() {
        var link = $(this).attr('href');
        link = link.substring(link.indexOf('\'') + 1, link.lastIndexOf('\''));
        if (link == url) {
            $(this).parents('li:first').addClass('active');
        }
    });
}
function clickLeftMenu(url) {
    $.ajax({
        url: APP_PATH + '/clickLeftMenu',
        data: {'url': url},
        type: 'POST',
        success: function(res) {
            document.location = url;
        }
    });
}
function initLeftMenu(url) {
    if (url == null || url == '')
        return;

    $('#side-menu a').each(function() {
        var link = $(this).attr('href');
        link = link.substring(link.indexOf('\'') + 1, link.lastIndexOf('\''));
        if (link == url) {
            $(this).addClass('active');
            if ($(this).parents('ul:first').hasClass('nav-second-level')) {
                $(this).parents('li:first').parents('li:first').addClass('active');
                $(this).parents('ul:first').addClass('collapse in');
            }
        }
    });
}

/* {'url':'<c:url value="/fireball/getCities"/>','data':'{"name":"lupeng"}'} */
function callAjax(opts, callback) {
    showWaiting();

    var url = opts.url;
    var data = opts.data;
    $.ajax({
        url: url,
        data: data,
        type: 'POST',
        success: function(res) {
            if (typeof callback == 'function') {
                callback(res);
            }

            dismissWaiting();
        }
    });
}

function resetForm() {
    $('form')[0].reset();
}

function clearAllErrorMsgs() {
    $('label.fld-err').remove();
}

function clearErrorMsg(fld) {
    if ($('#fld-err-' + fld).length > 0) {
        $('#fld-err-' + fld).parents('div:first').parents('div.has-error:first').removeClass('has-error');
        $('#fld-err-' + fld).remove();
    }
}

function showErrorMsg(fld, msg, val) {
    if ($('#fld-err-' + fld).length > 0) {
        $('#fld-err-' + fld).html(msg);
    } else {
        var elem = $('[name="' + fld + '"]');
        if ($('#' + fld).length > 0) {
            elem = $('#' + fld);
        }
        elem.val(val);
        $(elem).parents('div:first').parents('div:first').addClass('has-error');
        $(elem).parents('div:first').append('<span id="fld-err-' + fld + '" class="help-block fld-err">' + msg + '</span>');
    }
}

function clearIconMsg(fld) {
    if ($('#fld-icon-' + fld).length > 0) {
        $('#fld-icon-' + fld).remove();
    }
}

function clearIconAndErrorMsg(fld) {
    clearIconMsg(fld);
    clearErrorMsg(fld);
}

function showIconMsg(fld, msg, val) {
    if ($('#fld-icon-' + fld).length > 0) {
        $('#fld-icon-' + fld).html(msg);
    } else {
        var elem = $('[name="' + fld + '"]');
        if ($('#' + fld).length > 0) {
            elem = $('#' + fld);
        }
        elem.val(val);
        $(elem).parents('div:first').append('<span id="fld-icon-' + fld + '">' + msg + '</span>');
    }
}

function checkAllSelectors() {
    var elems = document.getElementsByName('selector');
    if (elems != null) {
        var checked = document.getElementById('allSelector').checked;
        for (var i = 0; i < elems.length; i++) {
            elems[i].checked = checked;
        }
    }
}

function updateAllSelector() {
    var elems = document.getElementsByName('selector');
    var checked = elems.length == 0 ? false : true;
    for (var i = 0; i < elems.length; i++) {
        if (!elems[i].checked) {
            checked = false;
            break;
        }
    }
    document.getElementById('allSelector').checked = checked;
}

function setRadioDefaultChecked(name) {
    if (!$('input:radio[name="' + name + '"]').is(':checked')) {
        $('input:radio[name="' + name + '"]:first').attr('checked', true);
    }
}

// {'url': '<c:url value="/system/user/search"/>', 'data': {'isBrowser': true, 'isMultiSelect': true, 'callback': 'updateSelectedCoach', 'refresh': true/false}};
function showPopupDialog(opts) {
    if (opts == null)
        return;

    var url = opts.url;
    if (url == null)
        return;

    //showWaiting();

    url = encodeURI(url);
    var data = opts.data ? opts.data : {};
    $.ajax({
        url: url,
        data: data,
        type: 'POST',
        dataType: 'html',
        success: function(html) {
            var elemId = $(html).filter('div.modal').attr('id');
            if (opts.refresh) {
                $('#' + elemId).remove();
            }
            if ($('#' + elemId).length == 0) {
                $('body').append(html);
            }
            $('#' + elemId).modal({
                backdrop: 'static',
                keyboard: false
            });
            $('#' + elemId).modal('show');
        }
    });
}

function callFunc(func) {
    this[func].apply(this, Array.prototype.slice.call(arguments, 1));
}

$.fn.clearFields = function() {
    return this.each(function() {
        var type = this.type, tag = this.tagName.toLowerCase();
        if (tag == 'form' || tag == 'div' || tag == 'span' || tag == 'ul')
            return $(':input', this).clearFields();

        if (type == 'text' || type == 'password' || type == 'hidden' || tag == 'textarea') {
            this.value = '';
        } else if (type == 'checkbox' || type == 'radio') {
            this.checked = false;
        } else if (tag == 'select') {
            this.selectedIndex = 0;
        }
    });
};

function getValuesByName(name) {
    var array = new Array();
    $('input[name=' + name + ']').each(function() {
        array.push($(this).val());
    });
    return array;
}

function toggleElementOnCheck(input, elem) {
    if ($('#' + input).is(':checked')) {
        $('#' + elem).show();
    } else {
        $('#' + elem).hide();
        $('#' + elem).clearFields();
    }
}

function isEmpty(str) {
    return str == null || str == '' || typeof str === 'undefined';
}

function toggleAuditInfo() {
    if ($('#auditInfoDiv').is(':visible')) {
        $('div.toggle').removeClass('minus').addClass('plus');
        $('#auditInfoDiv').hide();
    } else {
        $('div.toggle').removeClass('plus').addClass('minus');
        $('#auditInfoDiv').show();
    }
}

function toggleAuditInfoOfId(auditId) {
    if ($('#' + auditId).is(':visible')) {
        $('div.toggle').removeClass('minus').addClass('plus');
        $('#' + auditId).hide();
    } else {
        $('div.toggle').removeClass('plus').addClass('minus');
        $('#' + auditId).show();
    }
}

function roundNumber(num, len) {
    return num.toFixed(len);
}
function roundNumber2(num) {
    return num.toFixed(1);
}

//add new method for array
Array.prototype.contains = function(obj) {
    var i = this.length;
    while (i--) {
        if (this[i] === obj) {
            return true;
        }
    }
    return false;
};

String.format = function(format) {
    var args = Array.prototype.slice.call(arguments, 1);
    return format.replace(/{(\d+)}/g, function(match, number) {
        return typeof args[number] != 'undefined' ? args[number] : match;
    });
}

/* the method is only for form */
$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

function queryStringToJson(qs) {
    return $.parseJSON('{"' + qs.replace(/&/g, '","').replace(/=/g, '":"') + '"}');
}

/* weixin functions */
function getOAuthUrl(appId, redirect, state) {
    var url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid={0}&redirect_uri={1}&response_type=code&scope=snsapi_userinfo&state={2}#wechat_redirect';
    //var url = 'http://localhost:8080/weixin/getOAuthCode.jsp?appid={0}&redirect_uri={1}&response_type=code&scope={2}&state={3}#wechat_redirect';
    return String.format(url, appId, encodeURIComponent(redirect), state);
}