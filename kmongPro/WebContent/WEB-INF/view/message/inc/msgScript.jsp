<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 						<script>
    var fileAttached;

    $(document).ready(function() {
        Dropzone.autoDiscover = true;
        var previewTemplate = "<div class='dz-preview dz-file-preview inline-block position-relative margin-right-15 margin-bottom-20'><div class='dz-details'><div class='dz-progress progress' ><span class='progress-bar dz-upload' data-dz-uploadprogress></span></div><i class='fa fa-times-circle cursor upload-close font-size-h3' aria-hidden='true' data-dz-remove></i><div class='dz-image border-radius cursor position-relative'><img class='border-radius width-95px' src='../image/tools/attached_file.png' width='95px' height='95px' data-dz-thumbnail /><div class='error-img'></div></div><h6 class='text-justify ellipsis upload-title-text upload-title-hover' style='top: 55px;' data-dz-name></h6><h4 class='upload-title-text NGB' style='top: 25px;' data-dz-size></h4><div class='dz-error-message-hover'><div class='dz-error-message upload-error' data-dz-errormessage></div><div class='upload-arrow'></div></div><div class='dz-success-mark'><span></span></div><div class='dz-error-mark'><span></span></div></div></div>";

        fileAttached = new Dropzone('.message-box-container', { // Make the whole body a dropzone
            url: "/upload",
            maxFilesize: 250, // MB
            thumbnailWidth: null,
            thumbnailHeight: 100,
            parallelUploads: 2,
            addRemoveLinks: false,
            maxFiles: 6,
            previewTemplate: previewTemplate,
            autoQueue: true, // Make sure the files aren't queued until manually added
            previewsContainer: ".dropzone-preview", // Define the container to display the previews
            clickable: "#dropzoneFile", // Define the element that should be used as click trigger to select files.
            dictCancelUpload: "",
            dictFileTooBig: '파일용량은 최대 250MB 입니다.',
            init: function() {
                this.on("addedfile", function(file) {
                    if (this.files.length) {
                        var _i, _len;
                        for (_i = 0, _len = this.files.length; _i < _len - 1; _i++) {
                            if( this.files[_i].name === file.name ) {
                                this.removeFile(file);
                            }
                        }
                    }
                });
            },
            processing: function (){
                if(typeof inbox_vue != 'undefined') {
                    inbox_vue.isOnGoingFileupload = true;
                }
            },
            success: function(file, response) {
                if(typeof inbox_vue != 'undefined') {
                    inbox_vue.isOnGoingFileupload = false;
                    inbox_vue.availableSendingMessage = true;
                    inbox_vue.files.push({FID: response.FID, fname: response.fname, preview_url: response.preview_url});
                }
                file['FID'] = response.FID;

            },
            maxfilesexceeded: function(file) {

                sweetalertByType('첨부파일 개수 초과', '최대 첨부가능 한 파일 갯수는 6개입니다.', 'info', 'timer');
                // 취소해도 다시 전송가능하도록
                if(typeof inbox_vue != 'undefined') {
                    inbox_vue.isOnGoingFileupload = false;
                    inbox_vue.availableSendingMessage = true;
                }
                this.removeFile(file);
            },
            removedfile: function(file) {
                if(file['FID'] > 0) {
                    inbox_vue.deleteUploadedFile(file['FID']);
                }
                $(document).find(file.previewElement).remove();
            },
            canceled: function(file, response) {
                // 취소해도 다시 전송가능하도록
                if(typeof inbox_vue != 'undefined') {
                    inbox_vue.isOnGoingFileupload = false;
                    inbox_vue.availableSendingMessage = true;
                }
            },
            error: function(file, response) {
                // 에러나도 다시 전송가능하도록
                if (file.previewElement) {
                    file.previewElement.classList.add("dz-error");
                }

                if(typeof inbox_vue != 'undefined') {
                    inbox_vue.isOnGoingFileupload = false;
                    inbox_vue.availableSendingMessage = true;
                }
            }
        });
    });
<script>
        var $globalBody = $('.global-body');
                
        if($('#penaltyDetailBanner').length > 0){
            $('#kmongNavBar').css('margin-top',$('#penaltyDetailBanner').height() + 'px');
            $('#penaltyDetailBanner').css({
                'position' : 'fixed',
                'top' : 0,
                'z-index' : 100
            });
        }
        
    </script>

</script>
<script src="/build/js/kmong-6359ab6b68.inbox.js"></script>
		<script src="/js/dropzone.js"></script>



		<script>
    $(document).ready(function(){
        inbox_vue.partnerUsername = 'jsaa11';
        inbox_vue.myUsername = 'nyj0602';
        inbox_vue.menu_type = 'MESSAGE';

                        inbox_vue.isSeller = true;
        
        // 키워드 필터링 데이터 전달 : 인박스
        inbox_vue.bannedKeywordData = [
                            {
                    id: '160',
                    keyword: '전화',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '161',
                    keyword: '카톡',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '162',
                    keyword: 'ㅋㅌ',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '163',
                    keyword: 'ㅋ ㅏ톡',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '164',
                    keyword: '070',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '165',
                    keyword: '국민',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '166',
                    keyword: '공일공',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '167',
                    keyword: '010',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '168',
                    keyword: '계좌',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '169',
                    keyword: 'ㄱ ㅖ좌',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '170',
                    keyword: 'ㄱ ㅖ 조 ㅏ',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '171',
                    keyword: '유선',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '173',
                    keyword: '공1공',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '174',
                    keyword: '통화',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '175',
                    keyword: '세금계산서',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '176',
                    keyword: '송금',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '177',
                    keyword: '부가세별도',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '179',
                    keyword: '별도',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '180',
                    keyword: '수수료',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '181',
                    keyword: '10%',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '182',
                    keyword: 'o1o',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '183',
                    keyword: '직거래',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '184',
                    keyword: '오투잡',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '185',
                    keyword: '재능넷',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '186',
                    keyword: '재능인',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '214',
                    keyword: '직.거래',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                            {
                    id: '215',
                    keyword: '현.금',
                    warning_mid: '1',
                    message: '주의: 결제 전 외부 연락처 공개 / 요청 시 직거래 유도 행위로 간주되어 사이트 이용이 제한될 수 있습니다.',
                },
                    ];

        $('.file-input-wrapper').hide();

        


            // 읽지않은 새 메시지가 있는 경우 scroll을 내렸을때
            // 메시지를 볼수 있는 위치에오면 새메시지 보여주는 부분을 없앤다.

        var $window = $(window)
        ;

        $window.scroll(function(){
            if(inbox_vue.pushedMessageIndexes.length > 0) {
                var unreadMessageIndex = inbox_vue.pushedMessageIndexes[0],
                $inbox = $('#inbox_'+ inbox_vue.inboxes[unreadMessageIndex].MID)
                ;
                // 현재 window의 pageYOffset <= 현재 insert된 메시지의 offsetTop이면 못봄 + window.height
                if($window[0].pageYOffset >= ($inbox.height() + $inbox[0].offsetTop) - $(window).height() + 50) {
                    inbox_vue.setInboxRead();
                }
            }
        });


        // 데스크탑일때
        // message-container의 min-height를 화면 사이즈에 따라 수정한다.
                    // 95 == global-body 의 margin-top(navbar height)
            var minHeight = $window.height() - 95 - 30 - 325 - 81 - 31;
        
                    $('.message-container').css('min-height', minHeight+'px');
        
            });

    function openMessageMenu() {
        setTimeout(function(){
                            $('.message-container').css('margin-bottom', $('#messageBox').height()+'px');
                    },500);
    }

    function setFileContent (FID, fname, resourceId, isAndroid) {
        inbox_vue.files.push({FID: FID, fname: fname, preview_url: null});
        inbox_vue.ori_fname = fname;
        inbox_vue.sendInboxMessage('sendFile');
    }

</script>
 -->