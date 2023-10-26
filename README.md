# @resultBuilder
Result builders in Swift allow you to build up a result using ‘build blocks’ lined up after each other.

Using it looks as follows:

    NSLayoutConstraint.activate {
         // Single constraint
         subView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
     
         label.constraintsForAnchoringTo(boundsOf: view) // Returns an array
     
     // Unwrapping an optional
     if let fixedLogoSize = fixedLogoSize {
         subView.widthAnchor.constraint(equalToConstant: fixedSize.width)
         subView.heightAnchor.constraint(equalToConstant: fixedSize.height)
     }
     
     // Conditional check
     if alignLogoTop {
         // Handle either the first component:
         subView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
     } else {
         // Or the second component:
         subView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
     }
    } 
