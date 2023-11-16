// END
questions = ( typeof questions != 'undefined' && questions instanceof Array ) ? questions : [];
questions.push( check_fullscreen('END') );
END = [];    //temporal timeline

button_label_next = 'End Study';


var END_screen = {
    type: 'instructions',
    pages: [''],
    button_label_next: button_label_next,
    data: {trialid: 'END_001', procedure: 'END', stimulus: '', response: unique_code},
    show_clickable_nav: true,
    on_finish: function(){
      jsPsych.endExperiment(Goodbye_001_on_finish);
    }
};
END.unshift(END_screen);
END.push.apply(questions, END);
call_function("END");