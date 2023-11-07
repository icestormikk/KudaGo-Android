import QtQuick 2.15
import QtQuick.Controls

Item {
   width: blocks_list.width
   height: 500

   Button {
       id: test_button
       text: 'Submit'
       anchors.centerIn: parent
       onClicked: {
           parameter_container.isCompleted = true
           parameter_container.onSubmit('Pasha')
       }
   }
}
