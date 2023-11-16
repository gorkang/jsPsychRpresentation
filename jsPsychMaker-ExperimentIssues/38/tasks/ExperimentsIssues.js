/* CSCN - Created with jsPsychMaker: https://github.com/gorkang/jsPsychMaker */
    
  questions = ( typeof questions != 'undefined' && questions instanceof Array ) ? questions : [];
  questions.push( check_fullscreen('ExperimentsIssues') );
  ExperimentsIssues = [];    //temporal timeline
    
  var instruction_screen_experiment = {
    type: 'instructions',
    pages: [`<p><left><b><big>Errors in experimental protocols</big></b><br /><br />Preparing experimental protocols is hard. Sometimes we can make mistakes, well, or so we've heard from a friend...</p>`],
    data:{trialid: 'ExperimentsIssues_000', procedure: 'ExperimentsIssues'},
    show_clickable_nav: true,
    on_trial_start: function(){
      bloquear_enter = 0;
      }
    };
    
  var question001 = {
    type: 'survey-multi-choice',
    questions: [{
      options: ['&nbsp;Always', '&nbsp;Often', '&nbsp;Sometimes', '&nbsp;Rarely', '&nbsp;Never'],
      prompt: 'From what you have heard, how often there are issues in experimental protocols? Issues can range from spelling errors in the protocol to errors in the experimental design that prevent from doing desired analysis.',
      required: true
    }],
    data: {trialid: 'ExperimentsIssues_001', procedure: 'ExperimentsIssues'}
  };
  ExperimentsIssues.push(question001);



  var question002 = {
    type: 'survey-multi-select',
    questions: [{
      options: ['&nbsp;Spelling errors', '&nbsp;Important content errors', '&nbsp;Errors in the coding of items', '&nbsp;Errors in participants balancing to conditions', '&nbsp;Data not what we expected', '&nbsp;Data preparation was harder than it could have been', '&nbsp;Match between hypotheses and data not clear', '&nbsp;Some variables or questions asked to participants but not used in the analysis/paper', '&nbsp;Errors so bad that my friend had to start over', '&nbsp;My friends do not have errors in their protocols', '&nbsp;Other'],
      prompt: 'Which of the following issues happened to your friend. In a experimental protocol or survey where data was collected in the lab or online',
      required: true
    }],
    data: {trialid: 'ExperimentsIssues_002', procedure: 'ExperimentsIssues'}
  };


  var if_question002 = {
    timeline: [question002],
    data: {trialid: 'ExperimentsIssues_002_if', procedure: 'ExperimentsIssues'},
    conditional_function: function(){
      try {
        let data = (JSON.parse((jsPsych.data.get().values().find(x => x.trialid === 'ExperimentsIssues_001'))['response'])['Q0']).trim();

      if((data) != 'Never'){
          return true;
        } else {
          return false;
        }
      } catch(err) {
        //alert('Error in if_question ExperimentsIssues_002')
        return false;
      }
    },
  };
  ExperimentsIssues.push(if_question002);
  
  var question003 = {
    type: 'survey-multi-choice',
    questions: [{
      options: ['&nbsp;Of course', '&nbsp;No, but my Research assistant is'],
      prompt: 'Are you a God?',
      required: true
    }],
    data: {trialid: 'ExperimentsIssues_003', procedure: 'ExperimentsIssues'}
  };



    var if_question003 = {
      timeline: [question003],
      data: {trialid: 'ExperimentsIssues_003_if', procedure: 'ExperimentsIssues'},
      conditional_function: function(){
        try {
      let data = (JSON.parse((jsPsych.data.get().values().find(x => x.trialid === 'ExperimentsIssues_001'))['response'])['Q0']).trim();
       if((data) == 'Never'){
            return true;
          } else {
            return false;
          }
        } catch(err) {
          //alert('Error in if_question ExperimentsIssues_003')
          return false;
        }
      },
    };
  ExperimentsIssues.push(if_question003);
  
  var question004 = {
    type: 'survey-text',
    questions: [{
      prompt: 'What kind of errors did you have (if more than one, separate them by ;)',
      required: true
    }],
    data: {trialid: 'ExperimentsIssues_004', procedure: 'ExperimentsIssues'}
  };



    var if_question004 = {
      timeline: [question004],
      data: {trialid: 'ExperimentsIssues_004_if', procedure: 'ExperimentsIssues'},
      conditional_function: function(){
        try {
      let data = JSON.parse(jsPsych.data.get().values().find(x => x.trialid === 'ExperimentsIssues_002')['response']).Q0;
       if(data.some(index => index.includes('Other'))){
            return true;
          } else {
            return false;
          }
        } catch(err) {
          //alert('Error in if_question ExperimentsIssues_004')
          return false;
        }
      },
    };
  ExperimentsIssues.push(if_question004);
  
// Randomize order of items
// if (debug_mode === false) ExperimentsIssues = jsPsych.randomization.repeat(ExperimentsIssues,1);
ExperimentsIssues.unshift(instruction_screen_experiment);
questions.push.apply(questions, ExperimentsIssues);
    
call_function('ExperimentsIssues');
    
