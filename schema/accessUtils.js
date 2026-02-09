export const hasSession = ({ session }) => !!session?.data.id;

export const superuserOrPermission = ({ session, listKey }) =>
  session?.data.superuser ||
  session?.data.admin ||
  session?.data.permissions?.includes(listKey) ||
  false;

// const permissionsAccessControl = {
//   access: {
//     operation: {
//       // query: () => true,
//       create: superuserOrPermission,
//       update: superuserOrPermission,
//       delete: superuserOrPermission,
//     },
//   },
// };
